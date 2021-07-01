import 'package:auto_route/auto_route.dart';
import 'package:weather/presentation/pages/forecast_details_page.dart';
import 'package:weather/presentation/pages/forecast_page.dart';

@CupertinoAutoRouter(  
  routes: <AutoRoute>[  
    AutoRoute(page: ForecastPage, initial: true),  
    AutoRoute(page: ForecastDetailsPage),  
  ],  
)  
class $AppRouter {}  