part of ng_dart_ombdbapi;

@Component(
    selector: 'find-movie-by-title-box-cmp',
    templateUrl: 'package:ng_dart_ombdbapi/components/find/find_movie_by_title_box_cmp.html')
class FindMovieByTitleBoxCmp {

  String title;
  SOMDBService service;

  FindMovieByTitleBoxCmp(this.service);

  findMovie() {
    if (quiver_strings.isNotEmpty(title)) {
      service.findMovieByTitle(title);
    }
  }
}