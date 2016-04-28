part of ng_dart_ombdbapi;

@Component(
    selector: 'search-movie-box-cmp',
    templateUrl: 'packages/ng_dart_ombdbapi/components/search/search_movie_box_cmp.html',
    useShadowDom: false)
class SearchMovieBoxCmp {

  String searchValue;
  SOMDBService service;

  SearchMovieBoxCmp(this.service);

  searchMovie() {
    if (quiver_strings.isNotEmpty(searchValue)) {
      service.searchMovieWithApi(searchValue);
    }
  }
}