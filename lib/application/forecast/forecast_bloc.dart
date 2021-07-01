import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/core/errors/forecast_failure.dart';
import 'package:weather/data/models/forecast/forecast.dart';
import 'package:weather/data/repositories/forecast/i_forecast_repository.dart';

part 'forecast_event.dart';
part 'forecast_state.dart';

@injectable
class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  final IForecastRepository forecastRepository;

  ForecastBloc(this.forecastRepository) : super(ForecastInitial());

  @override
  Stream<ForecastState> mapEventToState(
    ForecastEvent event,
  ) async* {
    if (event is GetForecastsEvent) {
      yield Fetching();

      final result = await forecastRepository.getForecasts(
          appId: event.appId, regionId: event.regionId, units: event.units);

      yield result.fold((failer) => FailerFetch(failer),
          (forecasts) => SuccessfulFetch(forecasts));    
    }
  }
}
