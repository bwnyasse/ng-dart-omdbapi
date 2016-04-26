part of ng_dart_ombdbapi;

@Component(
    selector: 'search-movie-box',
    templateUrl: 'packages/ng_dart_ombdbapi/components/search_movie_box.html',
    useShadowDom: false)
class SearchMovieBox {

  String title;
  SOMDBService service;

  SearchMovieBox(this.service);

  findMovie() {
    if (quiver_strings.isNotEmpty(title)) {
      service.findMovieByTitle(title);
    }
  }
}