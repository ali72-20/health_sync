abstract class BaseUIState<T>{}


final class OnLoadingState<T> extends BaseUIState<T> {}
final class OnSuccessState<T> extends BaseUIState <T>{
  T? data;
  OnSuccessState({this.data});
}

final class OnErrorState<T> extends BaseUIState<T> {
   Exception? exception;
   OnErrorState({this.exception});
}