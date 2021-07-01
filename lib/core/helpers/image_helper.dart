import 'package:weather/data/models/forecast/forecast.dart';

class ImageHelper {
  static String getWeatherImagePath(Weather weather) {
    String svgAssetPath = 'assets/images/';

    switch (weather.status) {
      case WeatherStatus.thunderstorm:
        svgAssetPath += 'thunderstorm.svg';
        break;
      case WeatherStatus.drizzle:
        svgAssetPath += 'shower_rain.svg';
        break;
      case WeatherStatus.rain:
        if(weather.description.toLowerCase() == 'freezing rain'.toLowerCase()) {
          svgAssetPath += 'snow.svg';
        } else {
          svgAssetPath += 'rain.svg';
        }
        break;
      case WeatherStatus.snow:
        svgAssetPath += 'snow.svg';
        break;
      case WeatherStatus.mist:
        svgAssetPath += 'mist.svg';
        break;
      case WeatherStatus.smoke:
        svgAssetPath += 'mist.svg';
        break;
      case WeatherStatus.haze:
        svgAssetPath += 'mist.svg';
        break;
      case WeatherStatus.dust:
        svgAssetPath += 'mist.svg';
        break;
      case WeatherStatus.fog:
        svgAssetPath += 'mist.svg';
        break;
      case WeatherStatus.sand:
        svgAssetPath += 'mist.svg';
        break;
      case WeatherStatus.ash:
        svgAssetPath += 'mist.svg';
        break;
      case WeatherStatus.squall:
        svgAssetPath += 'mist.svg';
        break;
      case WeatherStatus.tornado:
        svgAssetPath += 'mist.svg';
        break;
      case WeatherStatus.clear:
          svgAssetPath += 'clear_sky_day.svg';
        break;
      case WeatherStatus.clouds:
        if(weather.description.contains('few clouds')){
            svgAssetPath += 'few_clouds_day.svg';
        }
        else if(weather.description.contains('scattered clouds')) {
          svgAssetPath += 'acattered_clouds.svg';
        } else {
          svgAssetPath += 'broken_clouds.svg';
        }
        break;
      case WeatherStatus.unKnown:
        svgAssetPath += 'clear_sky_day.svg';
        break;
    }

    return svgAssetPath;
  }
}