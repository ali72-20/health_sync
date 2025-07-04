import 'package:health_sync/domain/entities/auth/register_request_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_request_model.g.dart';

@JsonSerializable()
class RegisterRequestModel {
  @JsonKey(name: "firstName")
  final String firstName;
  @JsonKey(name: "lastName")
  final String lastName;
  @JsonKey(name: "username")
  final String username;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "password")
  final String password;
  @JsonKey(name: "phoneNumber")
  final String phoneNumber;
  @JsonKey(name: "gender")
  final String gender;
  @JsonKey(name: "address")
  final String address;
  @JsonKey(name: "accessLevel")
  final String accessLevel;

  RegisterRequestModel ({
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

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    return _$RegisterRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RegisterRequestModelToJson(this);
  }
  factory RegisterRequestModel.fromDomain(RegisterRequestEntity entity) {
    return RegisterRequestModel(
      firstName: entity.firstName,
      lastName: entity.lastName,
      username: entity.username,
      email: entity.email,
      password: entity.password,
      phoneNumber: entity.phoneNumber,
      gender: entity.gender,
      address: entity.address,
      accessLevel: entity.accessLevel,
    );
  }

}


