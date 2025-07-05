import 'package:health_sync/data/models/response_model/home/all_request_details_response_model.dart';
import 'package:health_sync/data/models/response_model/home/dash_board_card_response_model.dart';

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
}