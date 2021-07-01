// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../data/models/forecast/forecast.dart' as _i5;
import '../pages/forecast_details_page.dart' as _i4;
import '../pages/forecast_page.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    ForecastPageRoute.name: (routeData) => _i1.CupertinoPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.ForecastPage();
        }),
    ForecastDetailsPageRoute.name: (routeData) => _i1.CupertinoPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ForecastDetailsPageRouteArgs>();
          return _i4.ForecastDetailsPage(args.forecast, key: args.key);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(ForecastPageRoute.name, path: '/'),
        _i1.RouteConfig(ForecastDetailsPageRoute.name,
            path: '/forecast-details-page')
      ];
}

class ForecastPageRoute extends _i1.PageRouteInfo {
  const ForecastPageRoute() : super(name, path: '/');

  static const String name = 'ForecastPageRoute';
}

class ForecastDetailsPageRoute
    extends _i1.PageRouteInfo<ForecastDetailsPageRouteArgs> {
  ForecastDetailsPageRoute({required _i5.Forecast forecast, _i2.Key? key})
      : super(name,
            path: '/forecast-details-page',
            args: ForecastDetailsPageRouteArgs(forecast: forecast, key: key));

  static const String name = 'ForecastDetailsPageRoute';
}

class ForecastDetailsPageRouteArgs {
  const ForecastDetailsPageRouteArgs({required this.forecast, this.key});

  final _i5.Forecast forecast;

  final _i2.Key? key;
}
