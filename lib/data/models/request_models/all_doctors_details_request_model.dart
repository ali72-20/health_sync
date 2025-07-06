import 'package:json_annotation/json_annotation.dart';

part 'all_doctors_details_request_model.g.dart';

@JsonSerializable()
class AllDoctorsDetailsRequestModel {
  @JsonKey(name: "page")
  final int? page;

  AllDoctorsDetailsRequestModel ({
    this.page,
  });

  factory AllDoctorsDetailsRequestModel.fromJson(Map<String, dynamic> json) {
    return _$AllDoctorsDetailsRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AllDoctorsDetailsRequestModelToJson(this);
  }
}


