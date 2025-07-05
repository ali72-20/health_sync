import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_sync/core/api_result/ApiResult.dart';
import 'package:health_sync/domain/entities/home/all_request_details_entity.dart';
import 'package:health_sync/domain/entities/home/dash_board_response_card_entity.dart';
import 'package:health_sync/domain/repositories/home_repository.dart';
import 'package:health_sync/presentation/ui/dash_board/manager/dash_board_page_state.dart';
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
        return activeDoctors.data?.total;
      case OnFailure<DashBoardResponseCardEntity>():
        allSuccess = false;
    }
  }

  _getActivePatients() async {
    final activePatients = await _homeRepositoryContract.getActivePatients();
    switch (activePatients) {
      case OnSuccess<DashBoardResponseCardEntity>():
        return activePatients.data?.total;
      case OnFailure<DashBoardResponseCardEntity>():
        allSuccess = false;
    }
  }

  _getActiveClinics() async {
    final activeClinics = await _homeRepositoryContract.getActiveClinics();
    switch (activeClinics) {
      case OnSuccess<DashBoardResponseCardEntity>():
        return activeClinics.data?.total;
      case OnFailure<DashBoardResponseCardEntity>():
        allSuccess = false;
    }
  }

  _getAppPendingRequests() async {
    final allPendingRequests = await _homeRepositoryContract
        .getAllPendingRequests();
    switch (allPendingRequests) {
      case OnSuccess<DashBoardResponseCardEntity>():
        return allPendingRequests.data?.total;
      case OnFailure<DashBoardResponseCardEntity>():
        allSuccess = false;
    }
  }

  List<DoctorDetailsEntity> doctors = [];
  List<ClinicEntity> clinics = [];
  List<dynamic> currentList = [];

  _getAllRequestsDetails() async {
    final response = await _homeRepositoryContract.getAllRequestDetails();

    switch (response) {
      case OnSuccess<AllRequestDetailsEntity>():
        final data = response.data;

        doctors = data?.doctorDetails ?? [];
        clinics = data?.clinicDetails ?? [];

        allSuccess = true;
        break;

      case OnFailure<AllRequestDetailsEntity>():
        allSuccess = false;
        break;
    }
  }

  _getInitialData() async {
    emit(DashBoardPageOnLoadingState());
    int activeDoctors = await _getActiveDoctors();
    int activePatients = await _getActivePatients();
    int activeClinics = await _getActiveClinics();
    int allPendingRequests = await _getAppPendingRequests();
    await _getAllRequestsDetails();
    if (allSuccess) {
      currentList = doctors;
      emit(
        DashBoardPageOnSuccessState(
          activeDoctors: activeDoctors,
          activePatients: activePatients,
          activeClinics: activeClinics,
          allPendingRequests: allPendingRequests,
          activeDoctorsList: doctors,
        ),
      );
    } else {
      emit(
        DashBoardPageOnErrorState(exception: Exception("Failed to load data")),
      );
    }
  }

  _approveDoctor({required String doctorId, required int status}) async {
    emit(DashBoardPageOnLoadingState());
    final response = await _homeRepositoryContract.doctorApprove(
      doctorId: doctorId,
      status: status,
    );

    switch (response) {
      case OnSuccess<void>():
        emit(DashBoardPageOnSuccessState());
      case OnFailure<void>():
        emit(
          DashBoardPageOnErrorState(
            exception: Exception("Failed to approve doctor"),
          ),
        );
    }
  }

  _approveClinic({required String clinicId, required int status}) async {
    emit(DashBoardPageOnLoadingState());
    final response = await _homeRepositoryContract.clinicApprove(
      clinicId: clinicId,
      status: status,
    );

    switch (response) {
      case OnSuccess<void>():
        emit(DashBoardPageOnSuccessState());
      case OnFailure<void>():
        emit(
          DashBoardPageOnErrorState(
            exception: Exception("Failed to approve doctor"),
          ),
        );
    }
  }

  _changeTab(DashBoardPageTab tab) {
    currentList = tab == DashBoardPageTab.Doctors ? doctors : clinics;
  }

  void onEvent(DashBoardPageEvent event) {
    switch (event) {
      case DashBoardPageGetInitialDataEvent():
        _getInitialData();
      case ApproveDoctorEvent():
        _approveDoctor(doctorId: event.doctorId, status: event.status);
      case ApproveClinicEvent():
        _approveClinic(clinicId: event.clinicId, status: event.status);
      case ChangeTabEvent():
        _changeTab(event.tab);
    }
  }
}
