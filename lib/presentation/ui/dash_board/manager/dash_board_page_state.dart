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

  DashBoardPageOnSuccessState({
    this.activeDoctors,
    this.activePatients,
    this.activeClinics,
  });
}
