import 'package:health_sync/domain/entities/home/all_request_details_entity.dart';

abstract class DashBoardPageState {}

final class DashBoardPageInitialState extends DashBoardPageState {}

final class DashBoardPageOnLoadingState extends DashBoardPageState {}

final class DashBoardPageOnErrorState extends DashBoardPageState {
  final Exception exception;

  DashBoardPageOnErrorState({required this.exception});
}

final class DashBoardPageOnSuccessState extends DashBoardPageState {
  int? activeDoctors;
  int? activePatients;
  int? activeClinics;
  int? allPendingRequests;
  List<DoctorDetailsEntity>? activeDoctorsList;
  DashBoardPageOnSuccessState({
    this.activeDoctors,
    this.activePatients,
    this.activeClinics,
    this.allPendingRequests,
    this.activeDoctorsList
  });
}

final class DashBoardChangeTabState extends DashBoardPageState {
   List<dynamic>? list;
  DashBoardChangeTabState({this.list});
}
