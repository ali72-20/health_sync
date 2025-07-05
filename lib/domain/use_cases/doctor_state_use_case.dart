
import 'package:health_sync/core/api_result/ApiResult.dart';
import 'package:health_sync/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DoctorStateUseCase{
  final HomeRepositoryContract _homeRepositoryContract;


  DoctorStateUseCase(this._homeRepositoryContract);

  Future<ApiResult<void>> approveDoctor(String doctorId) async {
    return await _homeRepositoryContract.doctorApprove(doctorId: doctorId, status: 1);
  }
  Future<ApiResult<void>> rejectDoctor(String doctorId) async {
    return await _homeRepositoryContract.doctorApprove(doctorId: doctorId, status: 2);
  }
}
