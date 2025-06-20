import 'package:health_sync/core/api_result/ApiResult.dart';
import 'package:health_sync/domain/entities/auth/login_request_entity.dart';
import 'package:health_sync/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';




@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository{
  @override
  Future<ApiResult<void>> login(LoginRequestEntity entity) {
    // TODO: implement login
    throw UnimplementedError();
  }

}