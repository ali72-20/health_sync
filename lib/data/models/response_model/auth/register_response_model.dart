import 'package:health_sync/domain/entities/auth/register_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_response_model.g.dart';

@JsonSerializable()
class RegisterResponseModel {
  @JsonKey(name: "message")
  final dynamic? message;
  @JsonKey(name: "isAuthenticated")
  final bool? isAuthenticated;
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "roles")
  final List<String>? roles;
  @JsonKey(name: "accessToken")
  final String? accessToken;
  @JsonKey(name: "expiresOn")
  final String? expiresOn;
  @JsonKey(name: "refreshToken")
  final String? refreshToken;
  @JsonKey(name: "refreshTokenExpiration")
  final String? refreshTokenExpiration;

  RegisterResponseModel({
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

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return _$RegisterResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RegisterResponseModelToJson(this);
  }

  RegisterResponseEntity toDomain() {
    return RegisterResponseEntity(
      username: username,
      email: email,
      roles: roles,
    );
  }
}
