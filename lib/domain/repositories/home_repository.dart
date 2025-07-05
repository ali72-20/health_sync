import 'package:health_sync/core/api_result/ApiResult.dart';
import 'package:health_sync/domain/entities/home/all_request_details_entity.dart';
import 'package:health_sync/domain/entities/home/dash_board_response_card_entity.dart';

abstract interface class HomeRepositoryContract {
  Future<ApiResult<DashBoardResponseCardEntity>> getActiveDoctors();

  Future<ApiResult<DashBoardResponseCardEntity>> getActivePatients();

  Future<ApiResult<DashBoardResponseCardEntity>> getActiveClinics();

  Future<ApiResult<DashBoardResponseCardEntity>> getAllPendingRequests();

  Future<ApiResult<AllRequestDetailsEntity>> getAllRequestDetails();

  Future<ApiResult<void>> doctorApprove({
    required String doctorId,
    required int status,
  });

  Future<ApiResult<void>> clinicApprove({
    required String clinicId,
    required int status,
  });
}
