library ng_dart_ombdbapi;

@MirrorsUsed(targets: const ['ng_dart_ombdbapi'], override: '*')
import 'dart:mirrors';
import 'dart:async';
import 'dart:html';

import 'package:angular2/angular2.dart';
import 'package:angular2/core.dart';
import 'package:angular2/common.dart';
import 'package:angular2/router.dart';
import 'package:angular2/platform/common.dart';

import 'package:quiver/strings.dart' as quiver_strings;
import 'package:observe/observe.dart';
import 'package:chartjs/chartjs.dart' as chart_js;
import 'dart:convert';


part 'package:ng_dart_ombdbapi/components/find/find_movie_by_title_box_cmp.dart';

part 'package:ng_dart_ombdbapi/components/find/find_movie_by_title_result_cmp.dart';

part 'package:ng_dart_ombdbapi/components/find/find_route_cmp.dart';

part 'package:ng_dart_ombdbapi/components/search/search_route_cmp.dart';

part 'package:ng_dart_ombdbapi/components/search/search_movie_box_cmp.dart';

part 'package:ng_dart_ombdbapi/components/search/search_movie_result_cmp.dart';

part 'package:ng_dart_ombdbapi/components/detail/detail_route_cmp.dart';

part 'package:ng_dart_ombdbapi/components/detail/movie_detail_cmp.dart';

part 'package:ng_dart_ombdbapi/injectable/s_omdb_service.dart';

part 'package:ng_dart_ombdbapi/model/s_data_model.dart';

@Component(
    selector: 'my-application',
    template: '''
        <div class='container'>

            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#"><b>ng-dart</b> on OMDB Movies REST API</a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a [routerLink]="['Find']">Find by Title </a></li>
                            <li><a [routerLink]="['Search']">Search API</a></li>
                        </ul>

                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
            <router-outlet></router-outlet>
      </div>
      ''',
    directives: const [
      CORE_DIRECTIVES,
      FORM_DIRECTIVES,
      ROUTER_DIRECTIVES
    ],
    providers: const [
      SOMDBService,
      ROUTER_PROVIDERS,
      const Provider(LocationStrategy, useClass: HashLocationStrategy)
    ])
@RouteConfig(const [
  const Route(
      path: '/' + ApplicationCmp.FIND,
      name: 'Find',
      component: FindRouteCmp,
      useAsDefault: true),
  const Route(
      path: '/' + ApplicationCmp.SEARCH,
      name: 'Search',
      component: SearchRouteCmp),
  const Route(path: '/' + ApplicationCmp.DETAIL + '/:title' + '/:year',
      name: 'Detail',
      component: DetailRouteCmp)
])
class ApplicationCmp {

  // ROUTE
  /// Find
  ///
  static const String FIND = 'find';

  /// Search
  ///
  static const String SEARCH = 'search';

  /// Movie Full Detail
  ///
  static const String DETAIL = 'detail';

}