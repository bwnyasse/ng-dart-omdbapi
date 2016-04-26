part of ng_dart_ombdbapi;

@Injectable()
class SOMDBService {

  static String _API_OMDB_URL = 'http://www.omdbapi.com/';

  MovieChangeNotifier movieChangeNotifier = new MovieChangeNotifier(null);

  void findMovieByTitle(String title) {
    Map map = {};
    map['t'] = title;
    map['plot'] = 'short';
    map['r'] = 'json';

    final String url = _API_OMDB_URL + _encodeMapQueryParametersAsUrl(map);

    _performServerApiCall(url, method: 'GET').then((HttpRequest response) {
      Map json = JSON.decode(response.responseText);
      Movie movie = new Movie.fromOMDBApi(json);
      movieChangeNotifier.value = movie;
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

  /**
   * Transform a map of queries to a good url pattern
   *
   * Example : ?param1=value1&param2=value2
   */
  String _encodeMapQueryParametersAsUrl(Map data) =>
      "?" + data.keys.map((key) => "${Uri.encodeComponent(key)}=${Uri
          .encodeComponent(data[key])}").join("&");

}