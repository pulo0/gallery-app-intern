import 'service_locator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';


final locator = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
 preferRelativeImports: true,
 asExtension: true,
)
void setupDependencies() => locator.init();