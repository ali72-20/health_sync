

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_sync/presentation/ui/doctors/managers/doctors_page_state.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api_result/ApiResult.dart';
import '../../../../domain/repositories/home_repository.dart';
import 'doctors_page_event.dart';


@injectable
class DoctorsPageViewModel extends Cubit<DoctorsPageState>{
   final HomeRepositoryContract _homeRepositoryContract;
  DoctorsPageViewModel(this._homeRepositoryContract) : super(DoctorsPageInitialState());


  _approveDoctor(String doctorId) async{
    emit(DoctorsPageLoadingState());
    final result = await _homeRepositoryContract.doctorApprove(doctorId: doctorId, status: 1);
    switch (result) {
      case OnSuccess<void>():
        emit(DoctorsPageSuccessState());
        break;
      case OnFailure<void>():
        emit(DoctorsPageFailureState(errorMessage: result.exception.toString()));
        break;
    }
  }
  _rejectDoctor(String doctorId) async{
    emit(DoctorsPageLoadingState());
    final result = await _homeRepositoryContract.doctorApprove(doctorId: doctorId, status: 2);
    switch (result) {
      case OnSuccess<void>():
        emit(DoctorsPageSuccessState());
        break;
      case OnFailure<void>():
        emit(DoctorsPageFailureState(errorMessage: result.exception.toString()));
        break;
    }
  }
  void onEvent(DoctorsPageEvent event) {
    switch (event) {
      case ApproveDoctorEvent(): _approveDoctor(event.doctorId);
      case RejectDoctorEvent(): _rejectDoctor(event.doctorId);
    }
  }
}