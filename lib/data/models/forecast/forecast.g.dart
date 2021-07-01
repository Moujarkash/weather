// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherStatusAdapter extends TypeAdapter<WeatherStatus> {
  @override
  final int typeId = 5;

  @override
  WeatherStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return WeatherStatus.thunderstorm;
      case 1:
        return WeatherStatus.drizzle;
      case 2:
        return WeatherStatus.rain;
      case 3:
        return WeatherStatus.snow;
      case 4:
        return WeatherStatus.mist;
      case 5:
        return WeatherStatus.smoke;
      case 6:
        return WeatherStatus.haze;
      case 7:
        return WeatherStatus.dust;
      case 8:
        return WeatherStatus.fog;
      case 9:
        return WeatherStatus.sand;
      case 10:
        return WeatherStatus.ash;
      case 11:
        return WeatherStatus.squall;
      case 12:
        return WeatherStatus.tornado;
      case 13:
        return WeatherStatus.clear;
      case 14:
        return WeatherStatus.clouds;
      case 15:
        return WeatherStatus.unKnown;
      default:
        return WeatherStatus.thunderstorm;
    }
  }

  @override
  void write(BinaryWriter writer, WeatherStatus obj) {
    switch (obj) {
      case WeatherStatus.thunderstorm:
        writer.writeByte(0);
        break;
      case WeatherStatus.drizzle:
        writer.writeByte(1);
        break;
      case WeatherStatus.rain:
        writer.writeByte(2);
        break;
      case WeatherStatus.snow:
        writer.writeByte(3);
        break;
      case WeatherStatus.mist:
        writer.writeByte(4);
        break;
      case WeatherStatus.smoke:
        writer.writeByte(5);
        break;
      case WeatherStatus.haze:
        writer.writeByte(6);
        break;
      case WeatherStatus.dust:
        writer.writeByte(7);
        break;
      case WeatherStatus.fog:
        writer.writeByte(8);
        break;
      case WeatherStatus.sand:
        writer.writeByte(9);
        break;
      case WeatherStatus.ash:
        writer.writeByte(10);
        break;
      case WeatherStatus.squall:
        writer.writeByte(11);
        break;
      case WeatherStatus.tornado:
        writer.writeByte(12);
        break;
      case WeatherStatus.clear:
        writer.writeByte(13);
        break;
      case WeatherStatus.clouds:
        writer.writeByte(14);
        break;
      case WeatherStatus.unKnown:
        writer.writeByte(15);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ForecastAdapter extends TypeAdapter<Forecast> {
  @override
  final int typeId = 0;

  @override
  Forecast read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Forecast(
      fields[0] as DateTime,
      fields[1] as ForecastMainInfo,
      (fields[2] as List).cast<Weather>(),
      fields[3] as Clouds,
      fields[4] as Wind,
      fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Forecast obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.forecastMainInfo)
      ..writeByte(2)
      ..write(obj.weatherList)
      ..writeByte(3)
      ..write(obj.clouds)
      ..writeByte(4)
      ..write(obj.wind)
      ..writeByte(5)
      ..write(obj.visibility);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ForecastAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ForecastMainInfoAdapter extends TypeAdapter<ForecastMainInfo> {
  @override
  final int typeId = 1;

  @override
  ForecastMainInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ForecastMainInfo(
      fields[0] as double,
      fields[1] as int,
      fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ForecastMainInfo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.temp)
      ..writeByte(1)
      ..write(obj.pressure)
      ..writeByte(2)
      ..write(obj.humidity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ForecastMainInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WeatherAdapter extends TypeAdapter<Weather> {
  @override
  final int typeId = 2;

  @override
  Weather read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Weather(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
    )..status = fields[4] as WeatherStatus;
  }

  @override
  void write(BinaryWriter writer, Weather obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.main)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.icon)
      ..writeByte(4)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CloudsAdapter extends TypeAdapter<Clouds> {
  @override
  final int typeId = 3;

  @override
  Clouds read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Clouds(
      fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Clouds obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.all);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CloudsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WindAdapter extends TypeAdapter<Wind> {
  @override
  final int typeId = 4;

  @override
  Wind read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Wind(
      fields[0] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Wind obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.speed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WindAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forecast _$ForecastFromJson(Map<String, dynamic> json) {
  return Forecast(
    JsonHelper.getDateFromTimestampString(json['dt'] as int),
    ForecastMainInfo.fromJson(json['main'] as Map<String, dynamic>),
    (json['weather'] as List<dynamic>)
        .map((e) => Weather.fromJson(e as Map<String, dynamic>))
        .toList(),
    Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
    Wind.fromJson(json['wind'] as Map<String, dynamic>),
    json['visibility'] as int,
  );
}

ForecastMainInfo _$ForecastMainInfoFromJson(Map<String, dynamic> json) {
  return ForecastMainInfo(
    (json['temp'] as num).toDouble(),
    json['pressure'] as int,
    json['humidity'] as int,
  );
}

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
    json['id'] as int,
    json['main'] as String,
    json['description'] as String,
    json['icon'] as String,
  );
}

Clouds _$CloudsFromJson(Map<String, dynamic> json) {
  return Clouds(
    json['all'] as int,
  );
}

Wind _$WindFromJson(Map<String, dynamic> json) {
  return Wind(
    Wind._convertSpeedToKmPerHour(json['speed'] as num),
  );
}
