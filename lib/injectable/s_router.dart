part of ng_dart_ombdbapi;

@Injectable()
class SRouter implements Function {

  static const String DEFAULT_VIEW_PATH = 'views/';

  // View
  static const String HOME = 'home';
  static const String HOME_HTML = 'home.html';
  static const String MOVIE_DETAIL = 'movieDetail';
  static const String MOVIE_DETAIL_HTML = 'movie_detail.html';

  call(Router router, RouteViewFactory viewFactory) {
    viewFactory.configure({
      HOME : ngRoute(
          defaultRoute: true,
          path: '/' + HOME,
          view: DEFAULT_VIEW_PATH + HOME_HTML,
          preEnter: onHomeSRoutePreEnter,
          enter: onHomeSRouteEnter),

      MOVIE_DETAIL : ngRoute(
          path: '/' + MOVIE_DETAIL,
          view: DEFAULT_VIEW_PATH + MOVIE_DETAIL_HTML,
          preEnter: onMovieDetailSRoutePreEnter,
          enter: onMovieDetailSRouteEnter),
    });
  }

  // Home
  void onHomeSRoutePreEnter(RoutePreEnterEvent event) {
  }

  void onHomeSRouteEnter(RouteEnterEvent event) {
  }

  // Movie Detail
  void onMovieDetailSRoutePreEnter(RoutePreEnterEvent event) {
  }

  void onMovieDetailSRouteEnter(RouteEnterEvent event) {
  }
}