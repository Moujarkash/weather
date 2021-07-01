import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather/core/helpers/hive_helper.dart';
import 'package:weather/core/helpers/json_helper.dart';

part 'forecast.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveHelper.forecastHiveId)
class Forecast {
  @JsonKey(name: 'dt', fromJson: JsonHelper.getDateFromTimestampString)
  @HiveField(0)
  final DateTime date;
  @JsonKey(name: 'main')
  @HiveField(1)
  final ForecastMainInfo forecastMainInfo;
  @JsonKey(name: 'weather')
  @HiveField(2)
  final List<Weather> weatherList;
  @JsonKey(name: 'clouds')
  @HiveField(3)
  final Clouds clouds;
  @JsonKey(name: 'wind')
  @HiveField(4)
  final Wind wind;
  @JsonKey(name: 'visibility')
  @HiveField(5)
  final int visibility;

  Forecast(this.date, this.forecastMainInfo, this.weatherList, this.clouds, this.wind, this.visibility);

  factory Forecast.fromJson(Map<String, dynamic> json) => _$ForecastFromJson(json);
} 

@JsonSerializable()
@HiveType(typeId: HiveHelper.forecastMainInfoHiveId)
class ForecastMainInfo {
  @HiveField(0)
  final double temp;
  @HiveField(1)
  final int pressure;
  @HiveField(2)
  final int humidity;

  ForecastMainInfo(this.temp, this.pressure, this.humidity);

  factory ForecastMainInfo.fromJson(Map<String, dynamic> json) => _$ForecastMainInfoFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: HiveHelper.weatherHiveId)
class Weather {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String main;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String icon;
  @JsonKey(ignore: true)
  @HiveField(4)
  late final WeatherStatus status;

  Weather(this.id, this.main, this.description, this.icon) {
    _setWeatherStatus(main);
  }

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);

  void _setWeatherStatus(String group) {
    final groupMap = {
      "Thunderstorm": WeatherStatus.thunderstorm,
      "Drizzle": WeatherStatus.drizzle,
      "Rain": WeatherStatus.rain,
      "Snow": WeatherStatus.snow,
      "Mist": WeatherStatus.mist,
      "Smoke": WeatherStatus.smoke,
      "Haze": WeatherStatus.haze,
      "Dust": WeatherStatus.dust,
      "Fog": WeatherStatus.fog,
      "Sand": WeatherStatus.sand,
      "Ash": WeatherStatus.ash,
      "Squall": WeatherStatus.squall,
      "Tornado": WeatherStatus.tornado,
      "Clear": WeatherStatus.clear,
      "Clouds": WeatherStatus.clouds,
    };

    status = groupMap[group] ?? WeatherStatus.unKnown;
  }
}

@JsonSerializable()
@HiveType(typeId: HiveHelper.cloudsHiveId)
class Clouds {
  @HiveField(0)
  final int all;

  Clouds(this.all);

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: HiveHelper.windHiveId)
class Wind {
  @JsonKey(fromJson: _convertSpeedToKmPerHour)
  @HiveField(0)
  final double speed;

  Wind(this.speed);

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

  static double _convertSpeedToKmPerHour(num jsonValue) => jsonValue * 3.6;
}

@HiveType(typeId: HiveHelper.weatherStatusHiveId)
enum WeatherStatus {
  @HiveField(0)
  thunderstorm,
  @HiveField(1)
  drizzle,
  @HiveField(2)
  rain,
  @HiveField(3)
  snow,
  @HiveField(4)
  mist,
  @HiveField(5)
  smoke,
  @HiveField(6)
  haze,
  @HiveField(7)
  dust,
  @HiveField(8)
  fog,
  @HiveField(9)
  sand,
  @HiveField(10)
  ash,
  @HiveField(11)
  squall,
  @HiveField(12)
  tornado,
  @HiveField(13)
  clear,
  @HiveField(14)
  clouds,
  @HiveField(15)
  unKnown
}
