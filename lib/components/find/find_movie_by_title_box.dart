part of ng_dart_ombdbapi;

@Component(
    selector: 'find-movie-by-title-box',
    templateUrl: 'packages/ng_dart_ombdbapi/components/find/find_movie_by_title_box.html',
    useShadowDom: false)
class FindMovieByTitleBox {

  String title;
  SOMDBService service;

  FindMovieByTitleBox(this.service);

  findMovie() {
    if (quiver_strings.isNotEmpty(title)) {
      service.findMovieByTitle(title);
    }
  }
}