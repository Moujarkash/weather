import 'package:injectable/injectable.dart';

abstract class Environment {
  static const production = 'production';

  String get baseUrl;
  String get apiKey;

  String imageUrl(String name);
}

@LazySingleton(as: Environment, env: [Environment.production])
class ProductionEnvironment implements Environment {
  @override
  String get baseUrl => 'https://api.openweathermap.org/data/2.5/';

  @override
  String get apiKey => 'c8cd7994041ffa9350ff73b2c2143ee6';

  @override
  String imageUrl(String name) => 'http://openweathermap.org/img/wn$name@2x.png';
}