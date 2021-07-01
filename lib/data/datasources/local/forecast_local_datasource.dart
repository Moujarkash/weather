import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/data/models/forecast/forecast.dart';
import 'package:weather/core/utils/extenstions.dart';

@lazySingleton
class ForecastLocalDatasource {
  final Box<Forecast> _box;

  const ForecastLocalDatasource(this._box);

  Future<void> addForecast(Forecast forecast) async =>
      _box.put(forecast.date.dateOnly.millisecondsSinceEpoch.toString(), forecast);

  Future<void> addForecasts(List<Forecast> forecasts) async {
    for (final Forecast forecast in forecasts) {
      addForecast(forecast);
    }
  }

  Forecast? getForecastByDate(DateTime forecastDate) {
    return _box.get(forecastDate.dateOnly.millisecondsSinceEpoch.toString());
  }
}