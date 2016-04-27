library ng_dart_ombdbapi;

@MirrorsUsed(targets: const ['ng_dart_ombdbapi'], override: '*')
import 'dart:mirrors';
import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:quiver/strings.dart' as quiver_strings;
import 'package:observe/observe.dart';
import 'package:chartjs/chartjs.dart' as chart_js;
import 'dart:convert';

part 'components/find/find_movie_by_title_box.dart';

part 'components/find/find_movie_by_title_result.dart';

part 'components/search/search_movie_box.dart';

part 'components/search/search_movie_result.dart';

part 'components/detail/movie_detail.dart';

part 'injectable/s_router.dart';

part 'injectable/s_omdb_service.dart';

part 'model/s_data_model.dart';

class ApplicationUiModule extends Module {

  ApplicationUiModule() {
    // Component / Find
    bind(FindMovieByTitleBox);
    bind(FindMovieByTitleResult);

    // Component / Search
    bind(SearchMovieBox);
    bind(SearchMovieResult);

    // Component / Detail
    bind(MovieDetail);

    // Service
    bind(SOMDBService);

    // Routing
    bind(RouteInitializerFn, toImplementation: SRouter);
    bind(NgRoutingUsePushState,
        toValue: new NgRoutingUsePushState.value(false));
  }

}