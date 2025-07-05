import 'package:health_sync/domain/entities/home/all_request_details_entity.dart';

sealed class DashBoardPageEvent {}
final class DashBoardPageGetInitialDataEvent extends DashBoardPageEvent {}
final class ApproveDoctorEvent extends DashBoardPageEvent {
  final String doctorId;
  final int status;

  ApproveDoctorEvent({required this.doctorId, required this.status});
}

final class ApproveClinicEvent extends DashBoardPageEvent {
  final String clinicId;
  final int status;

  ApproveClinicEvent({required this.clinicId, required this.status});
}

final class ChangeTabEvent extends DashBoardPageEvent {
  DashBoardPageTab tab;
  ChangeTabEvent({required this.tab});
}

final class NavigateToDoctorDetailsPageEvent extends DashBoardPageEvent {
  final DoctorDetailsEntity? doctor;
  NavigateToDoctorDetailsPageEvent({this.doctor});
}

enum DashBoardPageTab{
  Doctors,
  Clinics,
}
