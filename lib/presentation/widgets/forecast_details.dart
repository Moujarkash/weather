import 'package:flutter/material.dart';
import 'package:weather/data/models/forecast/forecast.dart';
import 'package:weather/presentation/resources/colors.dart';
import 'package:weather/core/utils/extenstions.dart';
import 'package:weather/presentation/widgets/items/weather_item.dart';

class ForecastDetails extends StatelessWidget {
  final Forecast forecast;

  const ForecastDetails(this.forecast, {Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(width: 32,),
          SizedBox(
            width: MediaQuery.of(context).size.width/2 - 48 ,
            child: Column(
              children: [
                const Text(
                  'Dubia',
                   style: TextStyle(
                      color: lightTextColor,
                      fontSize: 32
                    ),
                  ),
                const SizedBox(height: 4,),
                  Text(
                    "${forecast.forecastMainInfo.temp.prettify(0)}°",
                    maxLines: 1,
                    style: const TextStyle(
                      color: lightTextColor,
                      fontSize: 72,
                      fontWeight: FontWeight.w400
                    ),
                  )
              ],
            ),
          ),
          const SizedBox(width: 16,),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: WeatherItem(
              title: 'Wind',
              value: "${(forecast.wind.speed).prettify(2)} Km/h",
            ),
          ),
          const SizedBox(width: 8,),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: WeatherItem(
              title: 'Humidity',
              value: "${forecast.forecastMainInfo.humidity.toDouble().prettify(2)}%",
            ),
          ),
          const SizedBox(width: 32,),
        ],
      ),
    );
  }
}
