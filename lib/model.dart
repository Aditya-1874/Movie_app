class Movie {
  String title;
  String originalTitle;
  double voteAverage;
  String overview;
  String releaseDate;
  String posterPath;
  String backdropPath;
  int movieId;

Movie({
  required this.originalTitle,
  required this.overview,
  required this.posterPath,
  required this.releaseDate,
  required this.title,
  required this.voteAverage,
  required this.backdropPath,
  required this.movieId
});

factory Movie.fromJson(Map<String,dynamic> json){
  return Movie(
      originalTitle: json["original_title"],
      overview: json["overview"] ,
      posterPath: json["poster_path"],
      releaseDate: json["release_date"],
      title: json["title"],
      voteAverage: json["vote_average"],
      backdropPath: json["backdrop_path"],
      movieId: json['id'] as int);
}
}

class Cast {
  String profilePath;
  String name;
  Cast({ required this.name, required this.profilePath});
  factory Cast.fromJson(Map<dynamic,dynamic> json){
    return Cast(
        profilePath: json["profile_path"] ,
        name: json['name']
    );
  }
  }