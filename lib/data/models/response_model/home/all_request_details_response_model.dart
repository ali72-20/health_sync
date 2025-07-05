import 'package:health_sync/domain/entities/home/all_request_details_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'all_request_details_response_model.g.dart';

@JsonSerializable()
class AllRequestDetailsResponseModel {
  @JsonKey(name: "doctorDetails")
  final List<DoctorDetails>? doctorDetails;
  @JsonKey(name: "clinicDetails")
  final List<dynamic>? clinicDetails;
  @JsonKey(name: "total")
  final int? total;

  AllRequestDetailsResponseModel({
    this.doctorDetails,
    this.clinicDetails,
    this.total,
  });

  factory AllRequestDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$AllRequestDetailsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AllRequestDetailsResponseModelToJson(this);
  }

  AllRequestDetailsEntity toDomain() {
    return AllRequestDetailsEntity(
      doctorDetails: doctorDetails?.map((e) => e.toDomain()).toList(),
      clinicDetails: clinicDetails,
      total: total,
    );
  }
}

@JsonSerializable()
class DoctorDetails {
  @JsonKey(name: "doctor_ID")
  final String? doctorID;
  @JsonKey(name: "doctor_Name")
  final String? doctorName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "phoneNumber")
  final String? phoneNumber;
  @JsonKey(name: "address")
  final String? address;
  @JsonKey(name: "gender")
  final String? gender;
  @JsonKey(name: "specialization")
  final String? specialization;
  @JsonKey(name: "yearsOfExp")
  final int? yearsOfExp;
  @JsonKey(name: "doctorClinics")
  final dynamic? doctorClinics;

  DoctorDetails({
    this.doctorID,
    this.doctorName,
    this.email,
    this.status,
    this.phoneNumber,
    this.address,
    this.gender,
    this.specialization,
    this.yearsOfExp,
    this.doctorClinics,
  });

  factory DoctorDetails.fromJson(Map<String, dynamic> json) {
    return _$DoctorDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DoctorDetailsToJson(this);
  }

  DoctorDetailsEntity toDomain() {
    return DoctorDetailsEntity(
      doctorID: doctorID,
      doctorName: doctorName,
      email: email,
      status: status,
      phoneNumber: phoneNumber,
      address: address,
      specialization: specialization,
      doctorClinics: doctorClinics,
      yearsOfExp: yearsOfExp,
      gender: gender,
    );
  }
}
