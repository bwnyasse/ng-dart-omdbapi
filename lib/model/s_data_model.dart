part of ng_dart_ombdbapi;

class MovieChangeNotifier extends ChangeNotifier {
  Movie _value;

  MovieChangeNotifier(this._value);

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

  Movie.fromOMDBApi(Map json)
      : Poster=json['Poster'],
        Title=json['Title'],
        Year=json['Year'],
        Genre=json['Genre'],
        Language=json['Language'],
        Director=json['Director'];


}