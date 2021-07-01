part of 'forecast_bloc.dart';

abstract class ForecastEvent extends Equatable {
  const ForecastEvent();

  @override
  List<Object> get props => [];
}

class GetForecastsEvent extends ForecastEvent {
  final String appId;
  final String regionId;
  final String units;

  const GetForecastsEvent(this.appId, this.regionId, this.units);

  @override
  List<Object> get props => [appId, regionId, units];
}
