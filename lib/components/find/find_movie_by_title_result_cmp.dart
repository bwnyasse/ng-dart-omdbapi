part of ng_dart_ombdbapi;

@Component(
    selector: 'find-movie-by-title-result-cmp',
    templateUrl: 'packages/ng_dart_ombdbapi/components/find/find_movie_by_title_result_cmp.html',
    useShadowDom: false)
class FindMovieByTitleResultCmp extends ShadowRootAware{

  SOMDBService service;
  Movie movie;

  FindMovieByTitleResultCmp(this.service);

  @override
  void onShadowRoot(ShadowRoot shadowRoot) {
    if(service.findMovieChangeNotifier.value != null){
      print("Value Change");
      movie = service.findMovieChangeNotifier.value;
    }

    service.findMovieChangeNotifier.changes.listen((records){
      print("Value Change from Record");
      movie = service.findMovieChangeNotifier.value;
      print(movie.Poster);
    });
  }
}