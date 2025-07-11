import 'package:health_sync/data/models/response_model/home/all_request_details_response_model.dart';
import 'package:health_sync/data/models/response_model/home/dash_board_card_response_model.dart';

import '../../../models/request_models/all_doctors_details_request_model.dart';
import '../../../models/response_model/doctors_response_details_model.dart';

abstract interface class HomeRemoteDataSourceContract {
  Future<DashBoardCardResponseModel> getActiveDoctors();
  Future<DashBoardCardResponseModel> getActivePatients();
  Future<DashBoardCardResponseModel> getActiveClinics();
  Future<DashBoardCardResponseModel> getAllPendingRequests();
  Future<AllRequestDetailsResponseModel> getAllRequestDetails();
  Future<void> doctorApprove({
    required String doctorId,
    required int status,
  });

  Future<void> clinicApprove({
    required String clinicId,
    required int status,
  });

  Future<List<DoctorsResponseDetailsModel>> getAllDoctors(AllDoctorsDetailsRequestModel model);
}