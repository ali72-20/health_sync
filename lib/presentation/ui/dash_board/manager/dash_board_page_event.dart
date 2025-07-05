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

enum DashBoardPageTab{
  Doctors,
  Clinics,
}
