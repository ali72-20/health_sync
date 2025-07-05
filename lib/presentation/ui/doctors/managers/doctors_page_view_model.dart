

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_sync/presentation/ui/doctors/managers/doctors_page_state.dart';
import 'package:injectable/injectable.dart';

import 'doctors_page_event.dart';


@injectable
class DoctorsPageViewModel extends Cubit<DoctorsPageState>{

  DoctorsPageViewModel() : super(DoctorsPageInitialState());


  _approveDoctor(String doctorId) async{
    emit(DoctorsPageLoadingState());

  }
  _rejectDoctor(String doctorId) async{

  }
  void onEvent(DoctorsPageEvent event) {
    switch (event) {
      // Handle events here
      case ApproveDoctorEvent(): _approveDoctor(event.doctorId);
      case RejectDoctorEvent(): _rejectDoctor(event.doctorId);
    }
  }
}