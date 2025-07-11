sealed class DoctorsPageEvent {}
final class ApproveDoctorEvent extends DoctorsPageEvent {
  final String doctorId;
  ApproveDoctorEvent({required this.doctorId});
}
final class RejectDoctorEvent extends DoctorsPageEvent {
  final String doctorId;
  RejectDoctorEvent({required this.doctorId});
}

final class GetAllDoctorsEvent extends DoctorsPageEvent{
  final int page;
  GetAllDoctorsEvent({this.page = 1});
}