import 'package:health_sync/domain/entities/home/doctors_details_entity.dart';

abstract class DoctorsPageState {}
final class DoctorsPageInitialState extends DoctorsPageState {}
final class DoctorsPageLoadingState extends DoctorsPageState {}
class DoctorsPageSuccessState extends DoctorsPageState {
  final List<AllDoctorsDetailsEntity>? allDoctors;
  final int? totalCount;

  DoctorsPageSuccessState({this.allDoctors, this.totalCount});
}
final class DoctorsPageFailureState extends DoctorsPageState {
  final String errorMessage;
  DoctorsPageFailureState({required this.errorMessage});
}
