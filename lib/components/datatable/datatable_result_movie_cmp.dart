/**
 * Copyright (c) 2016 ng-dart-omdbapi. All rights reserved
 * 
 * REDISTRIBUTION AND USE IN SOURCE AND BINARY FORMS,
 * WITH OR WITHOUT MODIFICATION, ARE NOT PERMITTED.
 * 
 * DO NOT ALTER OR REMOVE THIS HEADER.
 * 
 * Created on : 08/06/16
 * Author     : bwnyasse
 *  
 */
part of ng_dart_ombdbapi;

@Component(
    selector: 'datatable-result-movie-cmp',
    templateUrl: 'package:ng_dart_ombdbapi/components/datatable/datatable_result_movie_cmp.html')
class DatatableResutMovieCmp implements OnInit{

  List<Movie> selectedMovies = [];

  final SOMDBService _service;
  Timer timer;
  SearchMovie searchMovie;
  String cssChecked;

  DatatableResutMovieCmp(this._service);

  @override
  void ngOnInit() {
    if (_service.searchMovieDatatableChangeNotifier.value != null) {
      searchMovie = _service.searchMovieDatatableChangeNotifier.value;
    }

    _service.searchMovieDatatableChangeNotifier.changes.listen((records) {
      searchMovie = _service.searchMovieDatatableChangeNotifier.value;
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

  seeAll()  => searchMovie.movies.forEach((movie) {
    print(movie.Appreciation);
  });
}