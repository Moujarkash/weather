import 'package:auto_route/auto_route.dart';
import 'package:weather/presentation/pages/weather_details_page.dart';
import 'package:weather/presentation/pages/weather_page.dart';

@MaterialAutoRouter(  
  routes: <AutoRoute>[  
    AutoRoute(page: WeatherPage, initial: true),  
    AutoRoute(page: WeatherDetailsPage),  
  ],  
)  
class $AppRouter {}  