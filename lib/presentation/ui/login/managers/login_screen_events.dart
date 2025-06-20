sealed class LoginScreenEvents{}

class LoginEvent extends LoginScreenEvents{
  final String email;
  final String password;
  LoginEvent({required this.email, required this.password});
}

