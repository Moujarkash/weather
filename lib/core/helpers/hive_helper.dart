import 'package:hive/hive.dart';
import 'package:weather/data/models/forecast/forecast.dart';

class HiveHelper {
  static const int forecastHiveId = 0;
  static const int forecastMainInfoHiveId = 1;
  static const int weatherHiveId = 2;
  static const int cloudsHiveId = 3;
  static const int windHiveId = 4;
  static const int weatherStatusHiveId = 5;

  static void registerAdapters() {
    Hive.registerAdapter(ForecastAdapter());
    Hive.registerAdapter(ForecastMainInfoAdapter());
    Hive.registerAdapter(WeatherAdapter());
    Hive.registerAdapter(CloudsAdapter());
    Hive.registerAdapter(WindAdapter());
    Hive.registerAdapter(WeatherStatusAdapter());
  }
}