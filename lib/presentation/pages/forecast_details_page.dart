import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_animator/widgets/attention_seekers/pulse.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:weather/core/helpers/color_helper.dart';
import 'package:weather/data/models/forecast/forecast.dart';
import 'package:weather/presentation/resources/colors.dart';
import 'package:weather/presentation/widgets/forecast_background.dart';
import 'package:weather/presentation/widgets/forecast_details.dart';

class ForecastDetailsPage extends StatelessWidget {
  final Forecast forecast;

  const ForecastDetailsPage(this.forecast, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
              gradient:LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [ColorHelper.getWeatherColor(forecast.weatherList.first), ColorHelper.getWeatherColor(forecast.weatherList.first).withOpacity(0.8) , ColorHelper.getWeatherColor(forecast.weatherList.first).withOpacity(0.3)]
              )
          ),
          child: SafeArea(
            child: Stack(
              children: [
                PlayAnimation(
                  tween: Tween<double>(begin: 0.0 , end: 1.0),
                    builder: (context, child, double value){
                      return Opacity(
                          opacity: value,
                          child: child,
                      );
                    },
                    duration: const Duration(milliseconds: 750),
                    child: Pulse(
                        preferences: const AnimationPreferences(
                          autoPlay: AnimationPlayStates.Loop,
                          duration: Duration(seconds: 3),
                          offset: Duration(milliseconds: 300)
                        ),
                        child: ForecastBackground(forecast,),
                    ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 32 , top: 32),
                    child: Text(
                      forecast.weatherList.first.description.replaceAll(' ', '\n'),
                      style: const TextStyle(
                        color: lightTextColor,
                        fontSize: 35
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: PlayAnimation<double>(
                    tween: Tween<double>(begin: 250 , end: 0),
                    builder: (context, child, value){
                      return Transform.translate(
                          offset: Offset(0,value),
                          child: child,
                      );
                    },
                    duration: const Duration(milliseconds: 300),
                    delay: const Duration(milliseconds: 150),
                    curve: Curves.easeInOut,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ForecastDetails(forecast),
                        const SizedBox(height: 18,)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}