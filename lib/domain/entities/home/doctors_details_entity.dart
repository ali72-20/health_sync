class AllDoctorsDetailsEntity {
  final String? doctorID;
  final String? doctorName;
  final String? email;
  final int? status;
  final String? phoneNumber;
  final String? address;
  final String? gender;
  final String? specialization;
  final int? yearsOfExp;
  final List<DoctorClinicEntity>? doctorClinics;

  AllDoctorsDetailsEntity({
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

class DoctorClinicEntity {
  final int? clinicID;
  final String? name;
  final String? address;
  final String? contactNumber;
  final String? contactEmail;
  final dynamic servicesOffered;
  final dynamic operatingHours;
  final String? clinicManagerId;
  final int? status;
  final dynamic doctors;

  DoctorClinicEntity({
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
}
