part of ng_dart_ombdbapi;

@Component(
    selector: 'find-movie-by-title-result-cmp',
    templateUrl: 'package:ng_dart_ombdbapi/components/find/find_movie_by_title_result_cmp.html')
class FindMovieByTitleResultCmp implements OnInit {

  final Router _router;
  SOMDBService _service;
  Movie movie;

  FindMovieByTitleResultCmp(this._service,this._router);

  @override
  void ngOnInit() {
    if(_service.findMovieChangeNotifier.value != null){
      print("Value Change");
      movie = _service.findMovieChangeNotifier.value;
    }

    _service.findMovieChangeNotifier.changes.listen((records){
      print("Value Change from Record");
      movie = _service.findMovieChangeNotifier.value;
      print(movie.Poster);
    });
  }

  Future goToDetail(String title, String year) =>
      _router.navigate(['Detail', {'title': title , "year":year}]);
}