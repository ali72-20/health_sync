class RegisterRequestEntity {
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String password;
  final String phoneNumber;
  final String gender;
  final String address;
  final String accessLevel;

  RegisterRequestEntity({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.gender,
    required this.address,
    required this.accessLevel,
  });
}
