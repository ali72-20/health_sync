import 'package:health_sync/domain/entities/home/doctors_details_entity.dart';

abstract class DoctorsPageState {}
final class DoctorsPageInitialState extends DoctorsPageState {}
final class DoctorsPageLoadingState extends DoctorsPageState {}
final class DoctorsPageSuccessState extends DoctorsPageState{
  final List<AllDoctorsDetailsEntity>? allDoctors;
  DoctorsPageSuccessState({this.allDoctors});
}
final class DoctorsPageFailureState extends DoctorsPageState {
  final String errorMessage;
  DoctorsPageFailureState({required this.errorMessage});
}
