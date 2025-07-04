import 'package:dio/dio.dart';
import 'package:health_sync/data/api/core/api_end_points.dart';
import 'package:health_sync/data/models/response_model/auth/login_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../models/request_models/auth/login_request_model.dart';
import 'core/api_base_urls.dart';

part 'api_manager.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApiBaseUrls.BASE_URL)
abstract interface class ApiManager{

  @factoryMethod
  factory ApiManager(Dio dio) = _ApiManager;

  @POST(ApiEndPoints.login)
  Future<LoginResponseModel> login(@Body() LoginRequestModel model);

}