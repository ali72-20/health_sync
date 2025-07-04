import 'package:health_sync/domain/entities/auth/login_request_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request_model.g.dart';

@JsonSerializable()
class LoginRequestModel {
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "password")
  final String? password;

  LoginRequestModel ({
    this.email,
    this.password,
  });

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) {
    return _$LoginRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoginRequestModelToJson(this);
  }

  factory LoginRequestModel.fromDomain(LoginRequestEntity entity){
    return LoginRequestModel(
      email: entity.email,
      password: entity.password,
    );
  }
}


