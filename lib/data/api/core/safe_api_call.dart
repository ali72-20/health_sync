import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/api_result/ApiResult.dart';

Future<ApiResult<T>> safeApiCall<T>({required Future<T> Function() apiCall}) async {
  try {
    log("apicall started for $T");
    final result = await apiCall();
    return OnSuccess(data: result);
  } catch (e, s) {

    log('API Call failed for $T', error: e, stackTrace: s);


    if (e is DioException) {

      return OnFailure(exception: e);
    }

    return OnFailure(exception: e is Exception ? e : Exception("An unknown error occurred: ${e.toString()}"));
  }
}