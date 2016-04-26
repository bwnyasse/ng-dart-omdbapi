part of ng_dart_ombdbapi;

@Injectable()
class SRouter implements Function {

   static const String DEFAULT_VIEW_PATH = 'views/';
  // View
  static const String HOME = 'home';
  static const String HOME_HTML = 'home.html';

  call(Router router, RouteViewFactory viewFactory) {
    viewFactory.configure({
      HOME : ngRoute(
          defaultRoute: true,
      path: '/' + HOME,
      view: DEFAULT_VIEW_PATH + HOME_HTML,
      preEnter: onHomeSRoutePreEnter,
      enter: onHomeSRouteEnter)
    });
  }

  void onHomeSRoutePreEnter(RoutePreEnterEvent event) {
  }

   void onHomeSRouteEnter(RouteEnterEvent event) {
  }
}