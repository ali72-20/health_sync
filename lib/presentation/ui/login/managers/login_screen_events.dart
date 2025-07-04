import 'package:flutter/cupertino.dart';

sealed class LoginScreenEvents{}

class LoginEvent extends LoginScreenEvents{
  final String email;
  final String password;
  final GlobalKey<FormState> key;
  LoginEvent({required this.email, required this.password, required this.key});
}

class NavigateToRegisterEvent extends LoginScreenEvents{}

