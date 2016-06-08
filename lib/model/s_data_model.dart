part of ng_dart_ombdbapi;

/*************** SINGLE MOVIE ***************************/

/**
 * Change Notifier for Movie
 */
class FindMovieChangeNotifier extends ChangeNotifier {
  Movie _value;

  FindMovieChangeNotifier(this._value);

  @reflectable
  get value => _value;

  @reflectable
  set value(val) {
    _value = notifyPropertyChange(#value, _value, val);
  }
}

class Movie {
  String Released;
  String Type;
  String imdbVotes;
  String Runtime;
  String Response;
  String Poster;
  String imdbID;
  String Country;
  String Title;
  String imdbRating;
  String Year;
  String Rated;
  String Actors;
  String Plot;
  String Metascore;
  String Writer;
  String Genre;
  String Language;
  String Awards;
  String Director;
  String Appreciation;

  Movie.fromOMDBApi(Map json)
      : Poster=json['Poster'],
        Title=json['Title'],
        Year=json['Year'],
        Genre=json['Genre'],
        Language=json['Language'],
        Director=json['Director'];
}

/******************* SEARCH MODEL *******************************/
/**
 * Change Notifier for Search Movie
 */
class SearchMovieChangeNotifier extends ChangeNotifier {
  SearchMovie _value;

  SearchMovieChangeNotifier(this._value);

  @reflectable
  get value => _value;

  @reflectable
  set value(val) {
    _value = notifyPropertyChange(#value, _value, val);
  }
}

class SearchMovie {
  List<Movie> movies = [];
  String totalResults;

  SearchMovie.fromOMDBApi(Map json){
    totalResults = json['totalResults'];

    // prepare movie from Json result
    var searchResultsJson = json['Search'];
    searchResultsJson.forEach((result) => movies.add(new Movie.fromOMDBApi(result)));
    movies.sort((a,b)=> a.Year.compareTo(b.Year));

  }

}

