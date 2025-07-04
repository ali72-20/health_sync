import 'package:health_sync/data/models/request_models/auth/logout_request_model.dart';
import 'package:health_sync/data/models/request_models/auth/register_request_model.dart';
import 'package:health_sync/data/models/response_model/auth/register_response_model.dart';
import 'package:health_sync/data/models/response_model/auth/user_model.dart';

import '../../../models/request_models/auth/login_request_model.dart';
import '../../../models/response_model/auth/login_response_model.dart';

abstract interface class AuthRemoteDataSourceContract{
  Future<LoginResponseModel> login(LoginRequestModel model);
  Future<RegisterResponseModel> register(RegisterRequestModel model);
  Future<UserModel> getUserProfile({required String token});
  Future<void> logout(LogoutReuqestModel model);
}