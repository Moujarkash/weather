// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import 'application/forecast/forecast_bloc.dart' as _i11;
import 'core/utils/enviroment.dart' as _i6;
import 'data/datasources/local/forecast_local_datasource.dart' as _i7;
import 'data/datasources/remote/remote_data_source.dart' as _i8;
import 'data/models/forecast/forecast.dart' as _i4;
import 'data/repositories/forecast/forecast_repository.dart' as _i10;
import 'data/repositories/forecast/i_forecast_repository.dart' as _i9;
import 'injectable_module.dart' as _i12;

const String _production = 'production';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  await gh.lazySingletonAsync<_i3.Box<_i4.Forecast>>(
      () => injectableModule.forecastBox,
      preResolve: true);
  gh.lazySingleton<_i5.Dio>(() => injectableModule.dioInstance);
  gh.lazySingleton<_i6.Environment>(() => _i6.ProductionEnvironment(),
      registerFor: {_production});
  gh.lazySingleton<_i7.ForecastLocalDatasource>(
      () => _i7.ForecastLocalDatasource(get<_i3.Box<_i4.Forecast>>()));
  gh.lazySingleton<_i8.ApiClient>(
      () => _i8.ApiClient(get<_i5.Dio>(), get<_i6.Environment>()));
  gh.lazySingleton<_i9.IForecastRepository>(() => _i10.ForecastRepository(
      get<_i8.ApiClient>(), get<_i7.ForecastLocalDatasource>()));
  gh.factory<_i11.ForecastBloc>(
      () => _i11.ForecastBloc(get<_i9.IForecastRepository>()));
  return get;
}

class _$InjectableModule extends _i12.InjectableModule {}
