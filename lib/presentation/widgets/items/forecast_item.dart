import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/helpers/image_helper.dart';
import 'package:weather/data/models/forecast/forecast.dart';
import 'package:weather/core/utils/extenstions.dart';
import 'package:weather/presentation/resources/colors.dart';

class ForecastItem extends StatelessWidget {
  final Forecast forecast;
  final Function()? onItemClicked;

  const ForecastItem(this.forecast, {Key? key, this.onItemClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onItemClicked != null) {
          onItemClicked!();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [primaryColor , primaryColor.withOpacity(0.7)]
          ),
          borderRadius: BorderRadius.circular(14),
          image: DecorationImage(
            image: const AssetImage('assets/images/clear_sky_day.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
          )
        ),
        margin: const EdgeInsets.only(bottom: 8),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 6),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                        DateFormat('EEEE').format(forecast.date).toUpperCase(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w700
                        ),
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Expanded(
                    child: Text(
                        "${forecast.forecastMainInfo.temp.prettify(0)}°",
                        style: const TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w700
                        ),
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Expanded(
                    child: Container(
                        height: 64,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: SvgPicture.asset(ImageHelper.getWeatherImagePath(forecast.weatherList.first)),
                        //child: Image.network(forecast.weather.first.icon)
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}