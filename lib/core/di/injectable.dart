import 'package:all_4_u/core/di/injectable.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
    initializerName: 'init', preferRelativeImports: true, asExtension: true)
Future<void> configureDependencies(String env) async {
  getIt.init(environment: env);
}

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
}
