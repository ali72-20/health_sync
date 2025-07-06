import 'package:health_sync/core/api_result/ApiResult.dart';
import 'package:health_sync/data/api/core/safe_api_call.dart';
import 'package:health_sync/data/data_source/remote_data_source/home/home_remote_data_source_contract.dart';
import 'package:health_sync/domain/entities/home/all_request_details_entity.dart';
import 'package:health_sync/domain/entities/home/dash_board_response_card_entity.dart';
import 'package:health_sync/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/home/doctors_details_entity.dart';

@Injectable(as: HomeRepositoryContract)
class HomeRepositoryImpl implements HomeRepositoryContract {
  final HomeRemoteDataSourceContract _dataSourceContract;

  HomeRepositoryImpl(this._dataSourceContract);

  @override
  Future<ApiResult<DashBoardResponseCardEntity>> getActiveClinics() async {
    return await safeApiCall<DashBoardResponseCardEntity>(
      apiCall: () async {
        final response = await _dataSourceContract.getActiveClinics();
        return response.toDomain();
      },
    );
  }

  @override
  Future<ApiResult<DashBoardResponseCardEntity>> getActiveDoctors() async {
    return await safeApiCall<DashBoardResponseCardEntity>(
      apiCall: () async {
        final response = await _dataSourceContract.getActiveDoctors();
        return response.toDomain();
      },
    );
  }

  @override
  Future<ApiResult<DashBoardResponseCardEntity>> getActivePatients() async {
    return await safeApiCall<DashBoardResponseCardEntity>(
      apiCall: () async {
        final response = await _dataSourceContract.getActivePatients();
        return response.toDomain();
      },
    );
  }

  @override
  Future<ApiResult<DashBoardResponseCardEntity>> getAllPendingRequests() async {
    return await safeApiCall<DashBoardResponseCardEntity>(
      apiCall: () async {
        final response = await _dataSourceContract.getAllPendingRequests();
        return response.toDomain();
      },
    );
  }

  @override
  Future<ApiResult<AllRequestDetailsEntity>> getAllRequestDetails() async{
    return await safeApiCall<AllRequestDetailsEntity>(apiCall: ()async{
      final response = await _dataSourceContract.getAllRequestDetails();
      return response.toDomain();
    });
  }

  @override
  Future<ApiResult<void>> clinicApprove({required String clinicId, required int status}) async{
    return safeApiCall<void>(apiCall: ()async{
      return await _dataSourceContract.clinicApprove(
        clinicId: clinicId,
        status: status,
      );
    });
  }

  @override
  Future<ApiResult<void>> doctorApprove({required String doctorId, required int status}) async{
    return safeApiCall<void>(apiCall: ()async{
      return await _dataSourceContract.doctorApprove(
        doctorId: doctorId,
        status: status,
      );
    });
  }

  @override
  Future<ApiResult<List<AllDoctorsDetailsEntity>>> getAllDoctors() async{
    return await safeApiCall<List<AllDoctorsDetailsEntity>>(apiCall: ()async{
      final response = await _dataSourceContract.getAllDoctors();
      return response.map((e)=> e.toDomain()).toList();
    });
  }
}
