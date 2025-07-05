abstract class DoctorsPageState {}
final class DoctorsPageInitialState extends DoctorsPageState {}
final class DoctorsPageLoadingState extends DoctorsPageState {}
final class DoctorsPageSuccessState extends DoctorsPageState{}
final class DoctorsPageFailureState extends DoctorsPageState {
  final String errorMessage;
  DoctorsPageFailureState({required this.errorMessage});
}
