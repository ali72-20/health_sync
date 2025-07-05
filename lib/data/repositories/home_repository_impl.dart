import 'package:health_sync/core/api_result/ApiResult.dart';
import 'package:health_sync/data/api/core/safe_api_call.dart';
import 'package:health_sync/data/data_source/remote_data_source/home/home_remote_data_source_contract.dart';
import 'package:health_sync/domain/entities/home/dash_board_response_card_entity.dart';
import 'package:health_sync/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

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
}
