import 'package:dartz/dartz.dart';
import 'package:weather/core/errors/forecast_failure.dart';
import 'package:weather/data/models/forecast/forecast.dart';

abstract class IForecastRepository {
  Future<Either<ForecastFailure, IList<Forecast>>> getForecasts({required String appId, required String regionId, required String units});
}