import 'package:health_sync/domain/entities/auth/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "dob")
  final String? dob;
  @JsonKey(name: "userType")
  final dynamic? userType;
  @JsonKey(name: "gender")
  final String? gender;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "address")
  final String? address;
  @JsonKey(name: "isDeleted")
  final bool? isDeleted;
  @JsonKey(name: "refreshTokens")
  final dynamic? refreshTokens;
  @JsonKey(name: "requiredPapers")
  final dynamic? requiredPapers;
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "userName")
  final String? userName;
  @JsonKey(name: "normalizedUserName")
  final dynamic? normalizedUserName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "normalizedEmail")
  final dynamic? normalizedEmail;
  @JsonKey(name: "emailConfirmed")
  final bool? emailConfirmed;
  @JsonKey(name: "passwordHash")
  final dynamic? passwordHash;
  @JsonKey(name: "securityStamp")
  final dynamic? securityStamp;
  @JsonKey(name: "concurrencyStamp")
  final String? concurrencyStamp;
  @JsonKey(name: "phoneNumber")
  final String? phoneNumber;
  @JsonKey(name: "phoneNumberConfirmed")
  final bool? phoneNumberConfirmed;
  @JsonKey(name: "twoFactorEnabled")
  final bool? twoFactorEnabled;
  @JsonKey(name: "lockoutEnd")
  final dynamic? lockoutEnd;
  @JsonKey(name: "lockoutEnabled")
  final bool? lockoutEnabled;
  @JsonKey(name: "accessFailedCount")
  final int? accessFailedCount;

  UserModel ({
    this.firstName,
    this.lastName,
    this.dob,
    this.userType,
    this.gender,
    this.status,
    this.address,
    this.isDeleted,
    this.refreshTokens,
    this.requiredPapers,
    this.id,
    this.userName,
    this.normalizedUserName,
    this.email,
    this.normalizedEmail,
    this.emailConfirmed,
    this.passwordHash,
    this.securityStamp,
    this.concurrencyStamp,
    this.phoneNumber,
    this.phoneNumberConfirmed,
    this.twoFactorEnabled,
    this.lockoutEnd,
    this.lockoutEnabled,
    this.accessFailedCount,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserModelToJson(this);
  }

  UserEntity toDomain(){
    return UserEntity(
      name: userName,
      email: email,
    );
  }
}


