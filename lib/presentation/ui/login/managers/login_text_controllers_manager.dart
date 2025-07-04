


import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@singleton
@injectable
class LoginTextControllerManager{
     GlobalKey<FormState> formKey = GlobalKey<FormState>();
     TextEditingController _emailController = TextEditingController();
     TextEditingController _passwordController = TextEditingController();

     TextEditingController getController(LoginFormFields field){
        switch (field) {
          case LoginFormFields.EMAIL: return _emailController;
          case LoginFormFields.PASSWORD: return _passwordController;
        }
     }

     void dispose() {
       _emailController.dispose();
       _passwordController.dispose();
     }

}
enum LoginFormFields{
  EMAIL, PASSWORD
}