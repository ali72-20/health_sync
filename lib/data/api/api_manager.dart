import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'core/api_base_urls.dart';

part 'api_manager.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApiBaseUrls.BASE_URL)
abstract interface class ApiManager{

  @factoryMethod
  factory ApiManager(Dio dio) = _ApiManager;

}