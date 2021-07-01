import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/data/models/forecast/forecast.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  Dio get dioInstance {
    final dio = Dio();

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (request, handler) {
        request.sendTimeout = 10000;
        request.connectTimeout = 10000;
        request.receiveTimeout = 10000;

        return handler.next(request);
    }));

    return dio;
  }

  @preResolve
  @lazySingleton 
  Future<Box<Forecast>> get forecastBox => Hive.openBox('forecast');
}
