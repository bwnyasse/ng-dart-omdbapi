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

part 'components/find/find_movie_by_title_box_cmp.dart';

part 'components/find/find_movie_by_title_result_cmp.dart';

part 'components/search/search_movie_box_cmp.dart';

part 'components/search/search_movie_result_cmp.dart';

part 'components/detail/movie_detail_cmp.dart';

part 'injectable/s_router.dart';

part 'injectable/s_omdb_service.dart';

part 'model/s_data_model.dart';

class ApplicationUiModule extends Module {

  ApplicationUiModule() {
    // Component / Find
    bind(FindMovieByTitleBoxCmp);
    bind(FindMovieByTitleResultCmp);

    // Component / Search
    bind(SearchMovieBoxCmp);
    bind(SearchMovieResultCmp);

    // Component / Detail
    bind(MovieDetailCmp);

    // Service
    bind(SOMDBService);

    // Routing
    bind(RouteInitializerFn, toImplementation: SRouter);
    bind(NgRoutingUsePushState,
        toValue: new NgRoutingUsePushState.value(false));
  }

}