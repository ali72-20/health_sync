import 'package:health_sync/data/models/request_models/auth/register_request_model.dart';

import '../../../models/request_models/auth/login_request_model.dart';
import '../../../models/response_model/auth/login_response_model.dart';

abstract interface class AuthRemoteDataSourceContract{
  Future<LoginResponseModel> login(LoginRequestModel model);
  Future<void> register(RegisterRequestModel model);
}