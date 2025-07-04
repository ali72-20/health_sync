


import 'package:health_sync/core/api_result/ApiResult.dart';
import 'package:injectable/injectable.dart';

import '../../repositories/auth_repository.dart';

@injectable
class LogoutUseCase {
  final AuthRepository _authRepository;

  LogoutUseCase(this._authRepository);


  Future<ApiResult<void>> logout() async{
    return await _authRepository.logout();
  }

}