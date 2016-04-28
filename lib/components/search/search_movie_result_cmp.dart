part of ng_dart_ombdbapi;

@Component(
    selector: 'search-movie-result-cmp',
    templateUrl: 'packages/ng_dart_ombdbapi/components/search/search_movie_result_cmp.html',
    useShadowDom: false)
class SearchMovieResultCmp extends ShadowRootAware {

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
  SOMDBService service;
  Timer timer;
  SearchMovie searchMovie;



  SearchMovieResultCmp(this.service);

  @override
  void onShadowRoot(ShadowRoot shadowRoot) {
    if (service.searchMovieChangeNotifier.value != null) {
      searchMovie = service.searchMovieChangeNotifier.value;
    }

    service.searchMovieChangeNotifier.changes.listen((records) {
      searchMovie = service.searchMovieChangeNotifier.value;
    });

    var div1 = document.querySelector('#search-movie-list-group-container-id');
    new MutationObserver(_mutationCallbackEnsureToDisplayCanvas).observe(
        div1, childList: true, subtree:true);
  }

  canDisplay() => searchMovie != null && searchMovie.movies.length != 0;




  //
  void _mutationCallbackEnsureToDisplayCanvas(List<MutationRecord> mutations,
      MutationObserver observer) {
    mutations.forEach((mr) {
        print("ici");
      mr.addedNodes.forEach((Node n) {
        if (n is Element) {
          if (n.classes.contains('ng-last') ||
              n.classes.contains('ng-last-add')) {
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

    CanvasElement canvasElement = querySelector('#canvas') as CanvasElement;
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