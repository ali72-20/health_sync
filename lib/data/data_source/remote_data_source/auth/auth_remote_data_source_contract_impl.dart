import 'package:health_sync/data/api/api_manager.dart';
import 'package:health_sync/data/data_source/remote_data_source/auth/auth_remote_data_source_contract.dart';
import 'package:health_sync/data/models/request_models/auth/login_request_model.dart';
import 'package:health_sync/data/models/request_models/auth/logout_request_model.dart';
import 'package:health_sync/data/models/request_models/auth/register_request_model.dart';
import 'package:health_sync/data/models/response_model/auth/login_response_model.dart';
import 'package:health_sync/data/models/response_model/auth/register_response_model.dart';
import 'package:health_sync/data/models/response_model/auth/user_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSourceContract)
class AuthRemoteDataSourceContractImpl implements AuthRemoteDataSourceContract {
  final ApiManager _apiManager;

  AuthRemoteDataSourceContractImpl(this._apiManager);

  @override
  Future<LoginResponseModel> login(LoginRequestModel model) async {
    return await _apiManager.login(model);
  }

  @override
  Future<RegisterResponseModel> register(RegisterRequestModel model) async{
    return await _apiManager.register(model);
  }

  @override
  Future<UserModel> getUserProfile({required String token}) async{
     return await _apiManager.getUserProfile(token: token);
  }

  @override
  Future<void> logout(LogoutReuqestModel model)async {
    return await _apiManager.logout(model);
  }

}
