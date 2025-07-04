import 'package:health_sync/core/helpers/shared_prf_helpers/SharedPrefHelper.dart';
import 'package:health_sync/data/data_source/local_data_source/auth/auth_local_data_source_contract.dart';
import 'package:injectable/injectable.dart';


@Injectable(as:AuthLocalDataSourceContract )
class AuthLocalDataSourceImpl implements AuthLocalDataSourceContract{
  @override
  Future<void> deleteToken() async{
    SharedPrefHelper.removeSecureString("token");
  }

  @override
  Future<String?> getToken() async{
    return SharedPrefHelper.getSecureString("token");
  }

  @override
  Future<void> saveToken({required String token}) async{
    await SharedPrefHelper.setSecureString("token", token);
  }

}