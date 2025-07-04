import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_sync/core/api_result/ApiResult.dart';
import 'package:health_sync/domain/entities/auth/login_request_entity.dart';
import 'package:health_sync/domain/entities/auth/login_response_entity.dart';
import 'package:health_sync/domain/use_cases/auth/login_use_case.dart';
import 'package:health_sync/presentation/ui/core/base_managers/base_ui_state.dart';
import 'package:health_sync/presentation/ui/login/managers/login_screen_events.dart';
import 'package:health_sync/presentation/ui/login/managers/login_screen_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginScreenViewModel extends Cubit<LoginScreenStates> {
  final LoginUseCase _loginUseCase;

  LoginScreenViewModel(this._loginUseCase) : super(LoginScreenInitialState());

  _login(String email, String password) async {
    emit(OnLoadingState() as LoginScreenStates);
    LoginRequestEntity entity = LoginRequestEntity(
      email: email,
      password: password,
    );
    final result = await _loginUseCase.login(entity);
    switch (result) {
      case OnSuccess<LoginResponseEntity>():
        emit(OnSuccessState() as LoginScreenStates);
      case OnFailure<LoginResponseEntity>():
        emit(OnErrorState(exception: result.exception) as LoginScreenStates);
    }
  }

  onEvent(LoginScreenEvents event) {
    switch (event) {
      case LoginEvent():
        _login(event.email, event.password);
    }
  }
}
