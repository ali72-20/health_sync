



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_sync/presentation/ui/login/managers/login_screen_events.dart';
import 'package:health_sync/presentation/ui/login/managers/login_screen_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginScreenViewModel extends Cubit<LoginScreenStates>{
  LoginScreenViewModel(): super(LoginScreenInitialState());



  _login(String email, String password){

  }



  onEvent(LoginScreenEvents event){
    switch (event) {
      case LoginEvent():_login(event.email, event.password);
    }
  }

}