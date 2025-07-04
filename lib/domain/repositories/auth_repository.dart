import 'package:health_sync/core/api_result/ApiResult.dart';
import 'package:health_sync/domain/entities/auth/login_request_entity.dart';
import 'package:health_sync/domain/entities/auth/login_response_entity.dart';

abstract interface class AuthRepository {
  Future<ApiResult<LoginResponseEntity>> login(LoginRequestEntity entity);
}
