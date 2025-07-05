class AllRequestDetailsEntity {
  final List<DoctorDetailsEntity>? doctorDetails;
  final List<dynamic>? clinicDetails;
  final int? total;

  AllRequestDetailsEntity({
    this.doctorDetails,
    this.clinicDetails,
    this.total,
  });
}

class DoctorDetailsEntity {
  final String? doctorID;
  final String? doctorName;
  final String? email;
  final int? status;
  final String? phoneNumber;
  final String? address;
  final String? gender;
  final String? specialization;
  final int? yearsOfExp;
  final dynamic? doctorClinics;

  DoctorDetailsEntity({
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
}