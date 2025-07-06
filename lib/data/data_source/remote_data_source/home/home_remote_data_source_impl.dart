import 'package:health_sync/data/api/api_manager.dart';
import 'package:health_sync/data/data_source/remote_data_source/home/home_remote_data_source_contract.dart';
import 'package:health_sync/data/models/request_models/all_doctors_details_request_model.dart';
import 'package:health_sync/data/models/response_model/doctors_response_details_model.dart';
import 'package:health_sync/data/models/response_model/home/all_request_details_response_model.dart';
import 'package:health_sync/data/models/response_model/home/dash_board_card_response_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDataSourceContract)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSourceContract {
  final ApiManager _apiManager;

  HomeRemoteDataSourceImpl(this._apiManager);

  @override
  Future<DashBoardCardResponseModel> getActiveClinics() async {
    return await _apiManager.activeClinics();
  }

  @override
  Future<DashBoardCardResponseModel> getActiveDoctors() async {
    return await _apiManager.activeDoctors();
  }

  @override
  Future<DashBoardCardResponseModel> getActivePatients() async {
    return await _apiManager.activePatients();
  }

  @override
  Future<DashBoardCardResponseModel> getAllPendingRequests() async{
    return await _apiManager.getAllPendingRequests();
  }

  @override
  Future<AllRequestDetailsResponseModel> getAllRequestDetails()async {
    return await _apiManager.getAllRequestDetails();
  }

  @override
  Future<void> doctorApprove({required String doctorId, required int status}) async{
    return await _apiManager.doctorApprove(doctorId: doctorId, status: status);
  }

  @override
  Future<void> clinicApprove({required String clinicId, required int status}) async{
    return await _apiManager.clinicApprove(clinicId: clinicId, status: status);
  }

  @override
  Future<List<DoctorsResponseDetailsModel>> getAllDoctors(AllDoctorsDetailsRequestModel model) async{
    return await _apiManager.getAllDoctors(model);
  }
}
