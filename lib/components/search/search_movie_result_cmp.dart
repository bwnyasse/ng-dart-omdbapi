part of ng_dart_ombdbapi;

@Component(
    selector: 'search-movie-result-cmp',
    templateUrl: 'package:ng_dart_ombdbapi/components/search/search_movie_result_cmp.html')
class SearchMovieResultCmp implements OnInit, AfterViewInit, AfterViewChecked, AfterContentChecked {

  List<Movie> selectedMovies = [];
  var colors = [
    "#ff0000",
    "#0080ff",
    "#ffbf00",
    "#80ff00",
    "#00ffbf",
    "#00bfff",
    "#4000ff",
    "#8000ff",
    "#bf00ff",
    "#936c6c",
    "	#808080",
  ];

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

  @override
  void ngAfterViewInit() {
    var div1 = DOM.query('#search-movie-list-group-container-id');
    new MutationObserver(_mutationCallbackEnsureToDisplayCanvas).observe(
        div1, childList: true, subtree:true);
  }

  @override
  void ngAfterViewChecked() {

  }

  @override
  void ngAfterContentChecked() {
  }

  canDisplay() => searchMovie != null && searchMovie.movies.length != 0;

  hideMovie(Movie movie) => searchMovie != null && movie!=null && selectedMovies.contains(movie);

  void select(Movie movie) {
    if(!selectedMovies.contains(movie)){
      selectedMovies.add(movie);
      cssChecked = 'ion-android-checkbox-outline';
    }else{
      selectedMovies.remove(movie);
      cssChecked = 'ion-android-checkbox-outline-blank';
    }
  }

  void selectAll() {
    if(selectedMovies.isNotEmpty){
      selectedMovies.clear();
    }else{
      selectedMovies.clear();
      selectedMovies.addAll(searchMovie.movies);
    }
  }

  hideSelectAll() => selectedMovies.length == searchMovie.movies.length;
  //
  void _mutationCallbackEnsureToDisplayCanvas(List<MutationRecord> mutations,
      MutationObserver observer) {
    mutations.forEach((mr) {
      mr.addedNodes.forEach((Node n) {
        if (n is Element) {
          print(n.classes);
          if (n.classes.contains('isLast')) {
            print("YEAH");
            timer = new Timer(const Duration(milliseconds: 30), () {
              _buildPieChart();
              timer.cancel();
            });
          }
        }
      });
    });
  }


  void _buildPieChart() {
    int colorIndex = 0;
    List<chart_js.CircularChartData> dataList = [];

    Map<String, int> searchMoviePie = {};
    searchMovie.movies.forEach((movie) {
      if (searchMoviePie.containsKey(movie.Year)) {
        searchMoviePie[movie.Year] = searchMoviePie[movie.Year] + 1;
      } else {
        searchMoviePie[movie.Year] = 1;
      }
    });
    print(searchMoviePie.toString());
    chart_js.Chart.defaults.global.responsive = true;

    var canvas = DOM.query('#canvas');
    print("is Canvas ok  ? :" + canvas.toString());
    CanvasElement canvasElement = canvas as CanvasElement;
    var ctx = canvasElement.context2D;

    // Build circular
    searchMoviePie.forEach((k, v) {
      var data = new chart_js.CircularChartData(
          value: v,
          color: colors[colorIndex],
          label: k.toString()
      );
      dataList.add(data);
      colorIndex++;
    });

    new chart_js.Chart(ctx).Pie(dataList);

  }
}