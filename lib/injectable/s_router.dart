part of ng_dart_ombdbapi;

@Injectable()
class SRouter implements Function {

  static const String DEFAULT_VIEW_PATH = 'views/';

  // Views -----------------------------------------
  /// Find
  ///
  static const String FIND = 'find';
  static const String FIND_HTML = 'find.html';

  /// Search
  ///
  static const String SEARCH = 'search';
  static const String SEARCH_HTML = 'search.html';

  /// Movie Full Detail
  ///
  static const String DETAIL = 'detail';
  static const String DETAIL_HTML = 'detail.html';

  SOMDBService service;

  SRouter(this.service);

  call(Router router, RouteViewFactory viewFactory) {
    viewFactory.configure({
      // Find Route
      FIND : ngRoute(
          defaultRoute: true,
          path: '/' + FIND,
          view: DEFAULT_VIEW_PATH + FIND_HTML),

      // Search Route
      SEARCH : ngRoute(
          path: '/' + SEARCH,
          view: DEFAULT_VIEW_PATH + SEARCH_HTML),

      // Movie Detail
      DETAIL : ngRoute(
          path: '/' + DETAIL + '/:title' + '/:year',
          view: DEFAULT_VIEW_PATH + DETAIL_HTML,
          preEnter: onDetailPreEnterEvent),
    });
  }


  void onDetailPreEnterEvent(RoutePreEnterEvent event) {
    //
    var title = event.parameters['title'];
    var year = event.queryParameters['year'];
    print(title);
    print(year);
    service.findMovieByTitle(title, year);
  }
}