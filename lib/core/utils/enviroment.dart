import 'package:injectable/injectable.dart';

abstract class Environment {
  static const production = 'production';

  String get getBaseUrl;
}

@LazySingleton(as: Environment, env: [Environment.production])
class ProductionEnvironment implements Environment {
  @override
  String get getBaseUrl => 'https://drc-ims-dev.azurewebsites.net';
}