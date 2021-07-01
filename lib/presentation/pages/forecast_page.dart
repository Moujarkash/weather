import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/application/forecast/forecast_bloc.dart';
import 'package:weather/core/utils/enviroment.dart';
import 'package:weather/injection.dart';
import 'package:weather/presentation/routes/router.gr.dart';
import 'package:weather/presentation/widgets/error_view.dart';
import 'package:weather/presentation/widgets/items/forecast_item.dart';

class ForecastPage extends StatefulWidget {
  const ForecastPage({Key? key}) : super(key: key);

  @override
  _ForecastPageState createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  final String _regionId = '292223';
  final String _units = 'metric';
  final ForecastBloc _bloc = getIt<ForecastBloc>();
  final Environment _environment = getIt<Environment>();

  @override
  void initState() {
    _bloc.add(GetForecastsEvent(_environment.apiKey, _regionId, _units));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/watermark.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: BlocBuilder<ForecastBloc, ForecastState>(
              bloc: _bloc,
              builder: (BuildContext context, ForecastState state) {  
                if (state is Fetching) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is FailerFetch) {
                  return Center(
                    child: ErrorView(
                      onRetryClicked: () => _bloc.add(GetForecastsEvent(_environment.apiKey, _regionId, _units)),
                    ),
                  );
                } else if (state is SuccessfulFetch) {
                  final forecasts = state.forcasts;

                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(16),
                    itemCount: forecasts.length(),
                    itemBuilder: (context, index) {
                      final forecast = forecasts.toList()[index];
                      return ForecastItem(forecast, onItemClicked: () {
                        AutoRouter.of(context).push(ForecastDetailsPageRoute(forecast: forecast));
                      },);
                    }
                  );
                }

                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}