import 'package:health_sync/data/models/response_model/home/dash_board_card_response_model.dart';

abstract interface class HomeRemoteDataSourceContract {
  Future<DashBoardCardResponseModel> getActiveDoctors();
  Future<DashBoardCardResponseModel> getActivePatients();
  Future<DashBoardCardResponseModel> getActiveClinics();
}