import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/core/errors/forecast_failure.dart';
import 'package:weather/data/datasources/local/forecast_local_datasource.dart';
import 'package:weather/data/datasources/remote/remote_data_source.dart';
import 'package:weather/data/models/base_response/base_response.dart';
import 'package:weather/data/models/forecast/forecast.dart';
import 'package:weather/data/repositories/forecast/i_forecast_repository.dart';
import 'package:weather/core/utils/extenstions.dart';

@LazySingleton(as: IForecastRepository)
class ForecastRepository implements IForecastRepository {
  final ApiClient remote;
  final ForecastLocalDatasource local;

  ForecastRepository(this.remote, this.local);

  @override
  Future<Either<ForecastFailure, IList<Forecast>>> getForecasts({required String appId, required String regionId, required String units}) async {
    final List<Forecast> data = <Forecast>[];
    final today = DateTime.now();
    bool requiredRefresh = false;


    for (int i = 0; i < 5; i++) {
      final forecast = local.getForecastByDate(today.add(Duration(days: i)));
      if (forecast != null) {
        data.add(forecast);
      } else {
        requiredRefresh = true;
        data.clear();
        break;
      }
    }

    if (requiredRefresh) {
      late final BaseResponse<List<Forecast>> response;
      try {
        response = await remote.fetchForecast(appId: appId, regionId: regionId, units: units);
        
        if (response.code == '200') {
          final forecasts = response.data;

          for (int i = 0; i < 5; i++) {
            final forecast = forecasts.lastWhere((forecast) => forecast.date.dateOnly == today.dateOnly.add(Duration(days: i)));
            local.addForecast(forecast);
            data.add(forecast);
          }
        } else {
          return left(const ServerError());
        }

      } catch (error) {
        if (error.runtimeType == DioError) {
          return left(const ServerError());
        }

        return left(const UnexpectedError());
      }
    }

    return right(IList<Forecast>.from(data));
  }
}