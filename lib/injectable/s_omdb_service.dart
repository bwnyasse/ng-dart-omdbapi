part of ng_dart_ombdbapi;

@Injectable()
class SOMDBService {

  static String _API_OMDB_URL = 'http://www.omdbapi.com/';

  FindMovieChangeNotifier findMovieChangeNotifier = new FindMovieChangeNotifier(null);
  SearchMovieChangeNotifier searchMovieChangeNotifier = new SearchMovieChangeNotifier(null);

  void findMovieByTitle(String title,[String year]) {
    Map map = {};
    map['t'] = title;
    map['plot'] = 'short';
    map['r'] = 'json';

    if(quiver_strings.isNotEmpty(year)){
      map['y'] = year;
    }

    final String url = _API_OMDB_URL + SUtils.encodeMapQueryParametersAsUrl(map);

    _performServerApiCall(url, method: 'GET').then((HttpRequest response) {
      Map json = JSON.decode(response.responseText);
      Movie movie = new Movie.fromOMDBApi(json);
      findMovieChangeNotifier.value = movie;
    });
  }

  void searchMovieWithApi(String searchValue){
    Map map = {};
    map['s'] = searchValue;

    final String url = _API_OMDB_URL + SUtils.encodeMapQueryParametersAsUrl(map);

    _performServerApiCall(url, method: 'GET').then((HttpRequest response) {
      Map json = JSON.decode(response.responseText);
      SearchMovie searchMovie = new SearchMovie.fromOMDBApi(json);
      print(searchMovie.totalResults.toString());
      print(searchMovie.movies.length.toString());
      searchMovieChangeNotifier.value = searchMovie;
    });
  }


  Future<HttpRequest> _performServerApiCall(String url,
      {String sendData: null, String method: 'POST'}) async {
    // Specify JSON as content Type

    // Init the http request
    Future<HttpRequest> httpRequest;
    if (sendData == null) {
      httpRequest = HttpRequest.request(url,
          method: method);
    } else {
      httpRequest = HttpRequest.request(url,
          method: method, sendData: sendData);
    }

    return httpRequest;
  }


}