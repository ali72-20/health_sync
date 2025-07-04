
import 'package:health_sync/core/api_result/ApiResult.dart';

Future<ApiResult<T>> safeApiCall<T>({required Future<T> Function() apiCall}) async {
  try{
    final result = await apiCall();
    return OnSuccess(data: result);
  }catch(e){
    return OnFailure(exception: e is Exception? e : Exception("An unknown error occurred"));
  }
}