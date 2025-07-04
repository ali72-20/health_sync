import 'package:health_sync/core/api_result/ApiResult.dart';
import 'package:health_sync/domain/entities/auth/user_entity.dart';
import 'package:health_sync/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserProfileUseCase {
  final AuthRepository _authRepository;

  GetUserProfileUseCase(this._authRepository);

  Future<ApiResult<UserEntity>> getUserProfile() async {
    return await _authRepository.getUserProfile();
  }
}
