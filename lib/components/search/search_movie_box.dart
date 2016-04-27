part of ng_dart_ombdbapi;

@Component(
    selector: 'search-movie-box',
    templateUrl: 'packages/ng_dart_ombdbapi/components/search/search_movie_box.html',
    useShadowDom: false)
class SearchMovieBox {

  String searchValue;
  SOMDBService service;

  SearchMovieBox(this.service);

  searchMovie() {
    if (quiver_strings.isNotEmpty(searchValue)) {
      service.searchMovieWithApi(searchValue);
    }
  }
}