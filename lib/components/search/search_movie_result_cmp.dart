part of ng_dart_ombdbapi;

@Component(
    selector: 'search-movie-result-cmp',
    templateUrl: 'package:ng_dart_ombdbapi/components/search/search_movie_result_cmp.html')
class SearchMovieResultCmp implements OnInit {

  List<Movie> selectedMovies = [];

  final SOMDBService _service;
  Timer timer;
  SearchMovie searchMovie;
  String cssChecked;

  SearchMovieResultCmp(this._service);

  @override
  void ngOnInit() {
    if (_service.searchMovieChangeNotifier.value != null) {
      searchMovie = _service.searchMovieChangeNotifier.value;
    }

    _service.searchMovieChangeNotifier.changes.listen((records) {
      searchMovie = _service.searchMovieChangeNotifier.value;
    });
  }


  canDisplay() => searchMovie != null && searchMovie.movies.length != 0;

  hideMovie(Movie movie) =>
      searchMovie != null && movie != null && selectedMovies.contains(movie);

  void select(Movie movie) {
    if (!selectedMovies.contains(movie)) {
      selectedMovies.add(movie);
      cssChecked = 'ion-android-checkbox-outline';
    } else {
      selectedMovies.remove(movie);
      cssChecked = 'ion-android-checkbox-outline-blank';
    }
  }

  void selectAll() {
    selectedMovies.clear();
    if (selectedMovies.isEmpty) {
      selectedMovies.addAll(searchMovie.movies);
    }
  }

  hideSelectAll() => selectedMovies.length == searchMovie.movies.length;

}