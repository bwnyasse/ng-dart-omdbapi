library ng_dart_ombdbapi;

@MirrorsUsed(targets: const ['ng_dart_ombdbapi'], override: '*')
import 'dart:mirrors';
import 'package:angular/angular.dart';

part 'components/hello_world.dart';

part 'injectable/s_router.dart';

class ApplicationUiModule extends Module {

  ApplicationUiModule() {
    // Component
    bind(HelloWorld);

    // Routing
    bind(RouteInitializerFn, toImplementation: SRouter);
    bind(NgRoutingUsePushState,
        toValue: new NgRoutingUsePushState.value(false));
  }

}