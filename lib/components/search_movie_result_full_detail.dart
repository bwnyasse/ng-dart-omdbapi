part of ng_dart_ombdbapi;

@Component(
    selector: 'search-movie-result-full-detail',
    templateUrl: 'packages/ng_dart_ombdbapi/components/search_movie_result_full_detail.html',
    useShadowDom: false)
class SearchMovieResultFullDetail extends ShadowRootAware{



  SOMDBService service;
  Movie movie;

  SearchMovieResultFullDetail(this.service);

  @override
  void onShadowRoot(ShadowRoot shadowRoot) {
    if(service.movieChangeNotifier.value != null){
      movie = service.movieChangeNotifier.value;
    }

  }
}