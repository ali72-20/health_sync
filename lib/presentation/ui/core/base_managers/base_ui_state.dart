abstract class BaseUIState{}


final class OnLoadingState extends BaseUIState {}
final class OnSuccessState<T> extends BaseUIState {
  T? data;
  OnSuccessState({this.data});
}

final class OnErrorState extends BaseUIState {
   Exception? exception;
   OnErrorState({this.exception});
}