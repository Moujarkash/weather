import 'package:flutter/material.dart';
import 'package:weather/presentation/resources/colors.dart';
import 'package:weather/presentation/resources/styles.dart';
import 'package:weather/presentation/routes/router.gr.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: getThemeColor(),
        accentColor: secondaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      builder: (context, widget) {
        if (widget != null) {
          // return SafeArea(child: widget);
          return widget;
        }

        return Container();  
      },
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
