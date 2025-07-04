import 'package:health_sync/core/api_result/ApiResult.dart';
import 'package:health_sync/data/api/core/safe_api_call.dart';
import 'package:health_sync/data/data_source/local_data_source/auth/auth_local_data_source_contract.dart';
import 'package:health_sync/data/data_source/remote_data_source/auth/auth_remote_data_source_contract.dart';
import 'package:health_sync/data/models/request_models/auth/login_request_model.dart';
import 'package:health_sync/data/models/request_models/auth/register_request_model.dart';
import 'package:health_sync/domain/entities/auth/login_request_entity.dart';
import 'package:health_sync/domain/entities/auth/register_request_entity.dart';
import 'package:health_sync/domain/entities/auth/register_response_entity.dart';
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
        saveToken(response.accessToken ?? "");
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
        saveToken(response.accessToken ?? "");
        return response.toDomain();
      },
    );
  }

  void saveToken(String token) async {
    await _authLocalDataSourceContract.saveToken(token: token);
  }
}
