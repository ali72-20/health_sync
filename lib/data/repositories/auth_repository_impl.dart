import 'package:health_sync/core/api_result/ApiResult.dart';
import 'package:health_sync/data/api/core/safe_api_call.dart';
import 'package:health_sync/data/data_source/local_data_source/auth/auth_local_data_source_contract.dart';
import 'package:health_sync/data/data_source/remote_data_source/auth/auth_remote_data_source_contract.dart';
import 'package:health_sync/data/models/request_models/auth/login_request_model.dart';
import 'package:health_sync/data/models/request_models/auth/logout_request_model.dart';
import 'package:health_sync/data/models/request_models/auth/register_request_model.dart';
import 'package:health_sync/domain/entities/auth/login_request_entity.dart';
import 'package:health_sync/domain/entities/auth/register_request_entity.dart';
import 'package:health_sync/domain/entities/auth/register_response_entity.dart';
import 'package:health_sync/domain/entities/auth/user_entity.dart';
import 'package:health_sync/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/auth/login_response_entity.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSourceContract _authRemoteDataSourceContract;
  final AuthLocalDataSourceContract _authLocalDataSourceContract;

  AuthRepositoryImpl(
    this._authRemoteDataSourceContract,
    this._authLocalDataSourceContract,
  );

  @override
  Future<ApiResult<LoginResponseEntity>> login(
    LoginRequestEntity entity,
  ) async {
    return await safeApiCall<LoginResponseEntity>(
      apiCall: () async {
        final requestModel = LoginRequestModel.fromDomain(entity);
        final response = await _authRemoteDataSourceContract.login(
          requestModel,
        );
        _saveToken(response.accessToken ?? "");
        _saveRefreshToken(response.refreshToken ?? "");
        return response.toDomain();
      },
    );
  }

  @override
  Future<ApiResult<RegisterResponseEntity>> register(
    RegisterRequestEntity entity,
  ) async {
    return await safeApiCall<RegisterResponseEntity>(
      apiCall: () async {
        final model = RegisterRequestModel.fromDomain(entity);
        final response = await _authRemoteDataSourceContract.register(model);
        _saveToken(response.accessToken ?? "");
        _saveRefreshToken(response.refreshToken ?? "");
        return response.toDomain();
      },
    );
  }

  void _saveToken(String token) async {
    await _authLocalDataSourceContract.saveToken(token: token);
  }

  void _saveRefreshToken(String token) async {
    await _authLocalDataSourceContract.saveRefreshToken(refreshToken: token);
  }

  @override
  Future<ApiResult<UserEntity>> getUserProfile() async {
    return await safeApiCall<UserEntity>(
      apiCall: () async {
        String? token = await _authLocalDataSourceContract.getToken();
        final response = await _authRemoteDataSourceContract.getUserProfile(
          token: "Bearer $token" ?? "",
        );
        return response.toDomain();
      },
    );
  }

  @override
  Future<ApiResult<void>> logout() async {
    String? refreshToken = await _authLocalDataSourceContract.getRefreshToken();
    return safeApiCall<void>(
      apiCall: () async {
         await _authRemoteDataSourceContract.logout(
          LogoutReuqestModel(token: refreshToken),
        );
        await _authLocalDataSourceContract.deleteToken();
        await _authLocalDataSourceContract.deleteRefreshToken();
      },
    );
  }
}
