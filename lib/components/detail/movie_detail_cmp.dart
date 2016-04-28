part of ng_dart_ombdbapi;

@Component(
    selector: 'movie-detail-cmp',
    templateUrl: 'packages/ng_dart_ombdbapi/components/detail/movie_detail_cmp.html',
    useShadowDom: false)
class MovieDetailCmp extends ShadowRootAware{

  SOMDBService service;
  Movie movie;

  MovieDetailCmp(this.service);

  @override
  void onShadowRoot(ShadowRoot shadowRoot) {
    if(service.findMovieChangeNotifier.value != null){
      movie = service.findMovieChangeNotifier.value;
    }
    service.findMovieChangeNotifier.changes.listen((records){
      movie = service.findMovieChangeNotifier.value;
    });
  }

  goBack() =>  window.history.back();
}