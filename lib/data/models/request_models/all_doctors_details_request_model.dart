import 'package:json_annotation/json_annotation.dart';

part 'all_doctors_details_request_model.g.dart';

@JsonSerializable()
class AllDoctorsDetailsRequestModel {
  @JsonKey(name: "filter")
  final String filter;

  @JsonKey(name: "clinicsIds")
  final List<String> clinicsIds;

  @JsonKey(name: "specialization")
  final List<String> specialization;

  @JsonKey(name: "page")
  final int page;

  AllDoctorsDetailsRequestModel({
    required this.filter,
    required this.clinicsIds,
    required this.specialization,
    required this.page,
  });

  factory AllDoctorsDetailsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AllDoctorsDetailsRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllDoctorsDetailsRequestModelToJson(this);
}
