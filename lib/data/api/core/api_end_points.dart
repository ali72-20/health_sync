class ApiEndPoints{
  ApiEndPoints._();
  static const String login = "Auth/signin";
  static const String register = "AdminAuth/register_profile";
  static const String getUserProfile = "Dashboard/GetProfile";
  static const String logout = "Auth/logout";
  static const String pendingRequests = "Dashboard";
  static const String activeDoctors = "Dashboard/ActiveDoctors";
  static const String activeClinics = "Dashboard/ActiveClinics";
  static const String activePatients = "Dashboard/ActivePatient";
  static const String getDetails = "Dashboard/GetDetails";
  static const String approveDoctors = "Dashboard/DoctorApprove";
  static const String approveClinics = "Dashboard/ClinicApprove";
}