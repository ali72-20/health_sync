import 'package:health_sync/domain/entities/home/doctors_details_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'doctors_response_details_model.g.dart';

@JsonSerializable()
class DoctorsResponseDetailsModel {
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
  final List<DoctorClinics>? doctorClinics;

  DoctorsResponseDetailsModel ({
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

  factory DoctorsResponseDetailsModel.fromJson(Map<String, dynamic> json) {
    return _$DoctorsResponseDetailsModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DoctorsResponseDetailsModelToJson(this);
  }
  AllDoctorsDetailsEntity toDomain(){
    return AllDoctorsDetailsEntity(
      doctorID: doctorID,
      doctorName: doctorName,
      email: email,
      status: status,
      phoneNumber: phoneNumber,
      address: address,
      gender: gender,
      specialization: specialization,
      yearsOfExp: yearsOfExp,
      doctorClinics: doctorClinics?.map((e) => e.toDomain()).toList(),
    );
  }
}

@JsonSerializable()
class DoctorClinics {
  @JsonKey(name: "clinic_ID")
  final int? clinicID;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "address")
  final String? address;
  @JsonKey(name: "contactNumber")
  final String? contactNumber;
  @JsonKey(name: "contactEmail")
  final String? contactEmail;
  @JsonKey(name: "servicesOffered")
  final dynamic? servicesOffered;
  @JsonKey(name: "operatingHours")
  final dynamic? operatingHours;
  @JsonKey(name: "clinicManagerId")
  final String? clinicManagerId;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "doctors")
  final dynamic? doctors;

  DoctorClinics ({
    this.clinicID,
    this.name,
    this.address,
    this.contactNumber,
    this.contactEmail,
    this.servicesOffered,
    this.operatingHours,
    this.clinicManagerId,
    this.status,
    this.doctors,
  });

  factory DoctorClinics.fromJson(Map<String, dynamic> json) {
    return _$DoctorClinicsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DoctorClinicsToJson(this);
  }

  DoctorClinicEntity toDomain(){
    return DoctorClinicEntity(
      clinicID: clinicID,
      name: name,
      address: address,
      contactNumber: contactNumber,
      contactEmail: contactEmail,
    );
  }
}


