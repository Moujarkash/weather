// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../pages/weather_details_page.dart' as _i4;
import '../pages/weather_page.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    WeatherPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.WeatherPage();
        }),
    WeatherDetailsPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.WeatherDetailsPage();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(WeatherPageRoute.name, path: '/'),
        _i1.RouteConfig(WeatherDetailsPageRoute.name,
            path: '/weather-details-page')
      ];
}

class WeatherPageRoute extends _i1.PageRouteInfo {
  const WeatherPageRoute() : super(name, path: '/');

  static const String name = 'WeatherPageRoute';
}

class WeatherDetailsPageRoute extends _i1.PageRouteInfo {
  const WeatherDetailsPageRoute() : super(name, path: '/weather-details-page');

  static const String name = 'WeatherDetailsPageRoute';
}
