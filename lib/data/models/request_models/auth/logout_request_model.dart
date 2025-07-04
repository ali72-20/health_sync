import 'package:json_annotation/json_annotation.dart';

part 'logout_request_model.g.dart';

@JsonSerializable()
class LogoutReuqestModel {
  @JsonKey(name: "token")
  final String? token;

  LogoutReuqestModel ({
    this.token,
  });

  factory LogoutReuqestModel.fromJson(Map<String, dynamic> json) {
    return _$LogoutReuqestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LogoutReuqestModelToJson(this);
  }
}


