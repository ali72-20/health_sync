import 'package:health_sync/core/api_result/ApiResult.dart';
import 'package:health_sync/domain/entities/home/dash_board_response_card_entity.dart';

abstract interface class HomeRepositoryContract {
  Future<ApiResult<DashBoardResponseCardEntity>> getActiveDoctors();

  Future<ApiResult<DashBoardResponseCardEntity>> getActivePatients();

  Future<ApiResult<DashBoardResponseCardEntity>> getActiveClinics();
}
