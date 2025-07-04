import 'package:health_sync/domain/entities/auth/login_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  @JsonKey(name: "message")
  final dynamic? message;
  @JsonKey(name: "isAuthenticated")
  final bool? isAuthenticated;
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "roles")
  final List<dynamic>? roles;
  @JsonKey(name: "accessToken")
  final String? accessToken;
  @JsonKey(name: "expiresOn")
  final String? expiresOn;
  @JsonKey(name: "refreshToken")
  final String? refreshToken;
  @JsonKey(name: "refreshTokenExpiration")
  final String? refreshTokenExpiration;

  LoginResponseModel ({
    this.message,
    this.isAuthenticated,
    this.username,
    this.email,
    this.roles,
    this.accessToken,
    this.expiresOn,
    this.refreshToken,
    this.refreshTokenExpiration,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoginResponseModelToJson(this);
  }

  LoginResponseEntity toDomain(){
    return LoginResponseEntity(
      username: username,
      email: email
    );
  }
}


