import 'package:all_4_u/core/di/injectable.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
    initializerName: r'$initGetIt',
    preferRelativeImports: true,
    asExtension: false)
Future<void> configureDependencies() async {
  $initGetIt(getIt);
}

// abstract class Env {
//   static const dev = 'dev';
//   static const prod = 'prod';
// }
