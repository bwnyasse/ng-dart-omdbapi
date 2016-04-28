part of ng_dart_ombdbapi;

@Component(
    selector: 'movie-detail-cmp',
    templateUrl: 'package:ng_dart_ombdbapi/components/detail/movie_detail_cmp.html')
class MovieDetailCmp implements OnInit {

  SOMDBService service;
  Movie movie;

  MovieDetailCmp(this.service);

  @override
  void ngOnInit() {
    if (service.findMovieChangeNotifier.value != null) {
      movie = service.findMovieChangeNotifier.value;
    }
    service.findMovieChangeNotifier.changes.listen((records) {
      movie = service.findMovieChangeNotifier.value;
    });
  }

  goBack() => window.history.back();
}