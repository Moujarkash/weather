import 'dart:ui';

import 'package:weather/data/models/forecast/forecast.dart';

class ColorHelper {
  static Color getWeatherColor(Weather weather) {
    switch(weather.status){
        case WeatherStatus.thunderstorm:
          return const Color(0xff3C4B4D);
        case WeatherStatus.drizzle:
          return const Color(0xff3C4B4D);
        case WeatherStatus.rain:
          return const Color(0xff83B7B5);
        case WeatherStatus.snow:
          return const Color(0xff83B7B5);
        case WeatherStatus.mist:
          return const Color(0xff83B7B5);
        case WeatherStatus.smoke:
          return const Color(0xff83B7B5);
        case WeatherStatus.haze:
          return const Color(0xff83B7B5);
        case WeatherStatus.dust:
          return const Color(0xffF7B994);
        case WeatherStatus.fog:
          return const Color(0xff83B7B5);
        case WeatherStatus.sand:
          return const Color(0xffF7B994);
        case WeatherStatus.ash:
          return const Color(0xffF7B994);
        case WeatherStatus.squall:
          return const Color(0xffF7B994);
        case WeatherStatus.tornado:
          return const Color(0xff3C4B4D);
        case WeatherStatus.clear:
          return const Color(0xffF7B994);
        case WeatherStatus.clouds:
          return const Color(0xff83B7B5);
        case WeatherStatus.unKnown:
          return const Color(0xffF7B994);
      }
  }
}