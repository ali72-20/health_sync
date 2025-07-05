import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_sync/core/api_result/ApiResult.dart';
import 'package:health_sync/domain/entities/home/dash_board_response_card_entity.dart';
import 'package:health_sync/domain/repositories/home_repository.dart';
import 'package:health_sync/presentation/ui/dash_board/manager/dash_board_page_state.dart';
import 'package:health_sync/presentation/ui/doctors/view/doctors_view.dart';
import 'package:injectable/injectable.dart';

import 'dash_board_page_event.dart';

@injectable
class DashBoardPageViewModel extends Cubit<DashBoardPageState> {
  final HomeRepositoryContract _homeRepositoryContract;

  DashBoardPageViewModel(this._homeRepositoryContract)
    : super(DashBoardPageInitialState());

  bool allSuccess = true;

  _getActiveDoctors() async {
    final activeDoctors = await _homeRepositoryContract.getActiveDoctors();
    switch (activeDoctors) {
      case OnSuccess<DashBoardResponseCardEntity>():
        return activeDoctors.data;
      case OnFailure<DashBoardResponseCardEntity>():
        allSuccess = false;
    }
  }

  _getActivePatients() async {
    final activePatients = await _homeRepositoryContract.getActivePatients();
    switch (activePatients) {
      case OnSuccess<DashBoardResponseCardEntity>():
        return activePatients.data;
      case OnFailure<DashBoardResponseCardEntity>():
        allSuccess = false;
    }
  }

  _getActiveClinics() async {
    final activeClinics = await _homeRepositoryContract.getActiveClinics();
    switch (activeClinics) {
      case OnSuccess<DashBoardResponseCardEntity>():
        return activeClinics.data;
      case OnFailure<DashBoardResponseCardEntity>():
        allSuccess = false;
    }
  }

  _getInitialData() async {
    emit(DashBoardPageOnLoadingState());
    int activeDoctors = await _getActiveDoctors();
    int activePatients = await _getActivePatients();
    int activeClinics = await _getActiveClinics();
    if (allSuccess) {
      emit(
        DashBoardPageOnSuccessState(
          activeDoctors: activeDoctors,
          activePatients: activePatients,
          activeClinics: activeClinics,
        ),
      );
    } else {
      emit(
        DashBoardPageOnErrorState(exception: Exception("Failed to load data")),
      );
    }
  }

  void onEvent(DashBoardPageEvent event) {
    switch (event) {
      // Handle events here
      case DashBoardPageGetInitialDataEvent():
        _getInitialData();
    }
  }
}
