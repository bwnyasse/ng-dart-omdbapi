part of ng_dart_ombdbapi;

@Component(
    selector: 'search-movie',
    templateUrl: 'packages/ng_dart_ombdbapi/components/search_movie.html',
    useShadowDom: false)
class SearchMovie {

  String title;
  SOMDBService service;

  SearchMovie(this.service);

  findMovie() {
    if (quiver_strings.isNotEmpty(title)) {
      service.findMovieByTitle(title);
    }
  }
}