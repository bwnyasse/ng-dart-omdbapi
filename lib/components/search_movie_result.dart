part of ng_dart_ombdbapi;

@Component(
    selector: 'search-movie-result',
    templateUrl: 'packages/ng_dart_ombdbapi/components/search_movie_result.html',
    useShadowDom: false)
class SearchMovieResult extends ShadowRootAware{

  SOMDBService service;
  Movie movie;

  SearchMovieResult(this.service);

  @override
  void onShadowRoot(ShadowRoot shadowRoot) {
    if(service.movieChangeNotifier.value != null){
      print("Value Change");
      movie = service.movieChangeNotifier.value;
    }

    service.movieChangeNotifier.changes.listen((records){
      print("Value Change from Record");
      movie = service.movieChangeNotifier.value;
    });
  }
}