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
import 'package:ng_dart_ombdbapi/utils/s_injectable_utils.dart';


part 'package:ng_dart_ombdbapi/components/find/find_movie_by_title_box_cmp.dart';

part 'package:ng_dart_ombdbapi/components/find/find_movie_by_title_result_cmp.dart';

part 'package:ng_dart_ombdbapi/components/find/find_route_cmp.dart';

part 'package:ng_dart_ombdbapi/components/search/search_route_cmp.dart';

part 'package:ng_dart_ombdbapi/components/search/search_movie_box_cmp.dart';

part 'package:ng_dart_ombdbapi/components/datatable/datatable_route_cmp.dart';

part 'package:ng_dart_ombdbapi/components/datatable/datatable_box_cmp.dart';

part 'package:ng_dart_ombdbapi/components/datatable/datatable_result_movie_cmp.dart';

part 'package:ng_dart_ombdbapi/components/search/search_movie_result_cmp.dart';

part 'package:ng_dart_ombdbapi/components/detail/detail_route_cmp.dart';

part 'package:ng_dart_ombdbapi/components/detail/movie_detail_cmp.dart';

part 'package:ng_dart_ombdbapi/injectable/s_omdb_service.dart';

part 'package:ng_dart_ombdbapi/model/s_data_model.dart';

part 'package:ng_dart_ombdbapi/utils/s_components_utils.dart';

@Component(
    selector: 'my-application',
    template: '''
<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                <i class="icon-reorder shaded"></i>
            </a>
            <a class="brand" href="#">
                <b>ng-dart</b> OMDB API
            </a>
        </div>
    </div>
</div>

<div class="wrapper">
    <div class="container">
        <div class="row">
            <div class="span3">
                <div class="sidebar">

                    <ul class="widget widget-menu unstyled">
                        <li><a id="find-by-title-widget-menu-list-id" class="active" [routerLink]="['Find']">Find by Title </a></li>
                        <li><a id="search-api-widget-menu-list-id" [routerLink]="['Search']">Search API</a></li>
                        <li><a id="datatable-api-widget-menu-list-id" [routerLink]="['Datatable']">Datatable Example</a></li>
                    </ul>

                </div>
            </div>
            <div class="span9">
                <div class="content">
                    <router-outlet></router-outlet>
                </div>
            </div>
        </div>
    </div>
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
  const Route(
      path: '/' + ApplicationCmp.DATATABLE,
      name: 'Datatable',
      component: DatatableRouteCmp),
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

  /// Datatable
  ///
  static const String DATATABLE = 'datatable';

  /// Movie Full Detail
  ///
  static const String DETAIL = 'detail';

}