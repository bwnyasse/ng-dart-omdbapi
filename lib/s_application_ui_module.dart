library ng_dart_ombdbapi;

@MirrorsUsed(targets: const ['ng_dart_ombdbapi'], override: '*')
import 'dart:mirrors';
import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:quiver/strings.dart' as quiver_strings;
import 'package:observe/observe.dart';
import 'dart:convert';

part 'components/hello_world.dart';
part 'components/search_movie_box.dart';
part 'components/search_movie_result.dart';

part 'injectable/s_router.dart';
part 'injectable/s_omdb_service.dart';

part 'model/s_data_model.dart';

class ApplicationUiModule extends Module {

  ApplicationUiModule() {

    // Component
    bind(HelloWorld);
    bind(SearchMovieBox);
    bind(SearchMovieResult);

    // Service
    bind(SOMDBService);

    // Routing
    bind(RouteInitializerFn, toImplementation: SRouter);
    bind(NgRoutingUsePushState,
        toValue: new NgRoutingUsePushState.value(false));
  }

}