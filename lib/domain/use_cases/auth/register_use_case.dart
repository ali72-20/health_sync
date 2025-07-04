import 'package:health_sync/core/api_result/ApiResult.dart';
import 'package:health_sync/domain/entities/auth/register_request_entity.dart';
import 'package:health_sync/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  final AuthRepository _authRepository;

  RegisterUseCase(this._authRepository);

  Future<ApiResult<void>> register(RegisterRequestEntity entity) async {
    return await _authRepository.register(entity);
  }
}
