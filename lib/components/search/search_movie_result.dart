part of ng_dart_ombdbapi;

@Component(
    selector: 'search-movie-result',
    templateUrl: 'packages/ng_dart_ombdbapi/components/search/search_movie_result.html',
    useShadowDom: false)
class SearchMovieResult extends ShadowRootAware{

  String title;
  SOMDBService service;

  SearchMovie searchMovie;

  SearchMovieResult(this.service);

  @override
  void onShadowRoot(ShadowRoot shadowRoot) {
    if(service.searchMovieChangeNotifier.value != null){
      searchMovie = service.searchMovieChangeNotifier.value;
    }

    service.searchMovieChangeNotifier.changes.listen((records){
      searchMovie = service.searchMovieChangeNotifier.value;
    });
  }

  canDisplay() => searchMovie != null && searchMovie.movies.length != 0;
}