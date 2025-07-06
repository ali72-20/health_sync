import 'package:dio/dio.dart';
import 'package:health_sync/data/api/core/api_end_points.dart';
import 'package:health_sync/data/models/request_models/auth/logout_request_model.dart';
import 'package:health_sync/data/models/response_model/auth/login_response_model.dart';
import 'package:health_sync/data/models/response_model/auth/register_response_model.dart';
import 'package:health_sync/data/models/response_model/auth/user_model.dart';
import 'package:health_sync/data/models/response_model/doctors_response_details_model.dart';
import 'package:health_sync/data/models/response_model/home/all_request_details_response_model.dart';
import 'package:health_sync/data/models/response_model/home/dash_board_card_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../models/request_models/auth/login_request_model.dart';
import '../models/request_models/auth/register_request_model.dart';
import 'core/api_base_urls.dart';

part 'api_manager.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApiBaseUrls.BASE_URL)
abstract interface class ApiManager {
  @factoryMethod
  factory ApiManager(Dio dio) = _ApiManager;

  @POST(ApiEndPoints.login)
  Future<LoginResponseModel> login(@Body() LoginRequestModel model);

  @POST(ApiEndPoints.register)
  Future<RegisterResponseModel> register(@Body() RegisterRequestModel model);

  @GET(ApiEndPoints.getUserProfile)
  Future<UserModel> getUserProfile({
    @Header("Authorization") required String token,
  });

  @POST(ApiEndPoints.logout)
  Future<void> logout(@Body() LogoutReuqestModel model);

  @GET(ApiEndPoints.pendingRequests)
  Future<DashBoardCardResponseModel> getAllPendingRequests();

  @GET(ApiEndPoints.activeDoctors)
  Future<DashBoardCardResponseModel> activeDoctors();

  @GET(ApiEndPoints.activePatients)
  Future<DashBoardCardResponseModel> activePatients();

  @GET(ApiEndPoints.activeClinics)
  Future<DashBoardCardResponseModel> activeClinics();

  @GET(ApiEndPoints.getDetails)
  Future<AllRequestDetailsResponseModel> getAllRequestDetails();

  @POST(ApiEndPoints.doctorApprove)
  Future<void> doctorApprove({
    @Query("doctorId") required String doctorId,
    @Query("status") required int status,
  });

  @POST(ApiEndPoints.clinicApprove)
  Future<void> clinicApprove({
    @Query("clinicId") required String clinicId,
    @Query("status") required int status,
  });

  @GET(ApiEndPoints.allDoctors)
  Future<DoctorsResponseDetailsModel> getAllDoctors({
    @Query("page") int page = 1,
    @Query("limit") int limit = 10,
  });
}
