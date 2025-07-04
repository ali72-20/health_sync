import 'package:health_sync/core/api_result/ApiResult.dart';
import 'package:health_sync/domain/entities/auth/login_request_entity.dart';
import 'package:health_sync/domain/entities/auth/login_response_entity.dart';
import 'package:health_sync/domain/entities/auth/register_request_entity.dart';
import 'package:health_sync/domain/entities/auth/register_response_entity.dart';

abstract interface class AuthRepository {
  Future<ApiResult<LoginResponseEntity>> login(LoginRequestEntity entity);
  Future<ApiResult<RegisterResponseEntity>> register(RegisterRequestEntity entity);
}
