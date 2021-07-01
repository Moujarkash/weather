import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart' hide Environment;
import 'package:retrofit/retrofit.dart';
import 'package:weather/core/utils/enviroment.dart';
import 'package:weather/data/models/base_response/base_response.dart';
import 'package:weather/data/models/forecast/forecast.dart';

part 'remote_data_source.g.dart';

@lazySingleton
@RestApi(baseUrl: '')
abstract class ApiClient {
  @factoryMethod 
  factory ApiClient(Dio dio, Environment environment) {
    return _ApiClient(dio, baseUrl: environment.baseUrl);
  }

  @GET('/forecast')
  Future<BaseResponse<List<Forecast>>> fetchForecast(
      {@Query("id") required String regionId,
      @Query("appid") required String appId,
      @Query("units") required String units});
}