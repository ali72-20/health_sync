sealed class ApiResult<T>{}


class OnSuccess<T> extends ApiResult<T>{
  T? data;
  OnSuccess({this.data});
}

class OnFailure<T> extends ApiResult<T>{
  Exception? exception;
  OnFailure({this.exception});
}