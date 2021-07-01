import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather/core/helpers/image_helper.dart';
import 'package:weather/data/models/forecast/forecast.dart';

class ForecastBackground extends StatelessWidget {
  final Forecast forecast;

  const ForecastBackground(this.forecast, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width / 4) * 3;
    return Center(
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              width: width,
              child: SvgPicture.asset(
                ImageHelper.getWeatherImagePath(forecast.weatherList.first),
                width: width * 0.8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
