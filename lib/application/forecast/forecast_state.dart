part of 'forecast_bloc.dart';

abstract class ForecastState extends Equatable {
  const ForecastState();
  
  @override
  List<Object> get props => [];
}

class ForecastInitial extends ForecastState {}

class Fetching extends ForecastState {}

class SuccessfulFetch extends ForecastState {
  final IList<Forecast> forcasts;

  const SuccessfulFetch(this.forcasts);

  @override
  List<Object> get props => [forcasts];
}

class FailerFetch extends ForecastState {
  final ForecastFailure forecastFailure;

  const FailerFetch(this.forecastFailure);

  @override
  List<Object> get props => [forecastFailure];
}
