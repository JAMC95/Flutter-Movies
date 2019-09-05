// To parse this JSON data, do
//
//     final movieItem = movieItemFromJson(jsonString);

import 'dart:convert';

MovieItem movieItemFromJson(String str) => MovieItem.fromJson(json.decode(str));

String movieItemToJson(MovieItem data) => json.encode(data.toJson());

class MovieItem {
  int page;
  int totalResults;
  int totalPages;
  List<Result> results;

  MovieItem({
    this.page,
    this.totalResults,
    this.totalPages,
    this.results,
  });

  factory MovieItem.fromJson(Map<String, dynamic> json) => new MovieItem(
    page: json["page"],
    totalResults: json["total_results"],
    totalPages: json["total_pages"],
    results: new List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "total_results": totalResults,
    "total_pages": totalPages,
    "results": new List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  OriginalLanguage originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;

  Result({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  factory Result.fromJson(Map<String, dynamic> json) => new Result(
    popularity: json["popularity"].toDouble(),
    voteCount: json["vote_count"],
    video: json["video"],
    posterPath: json["poster_path"],
    id: json["id"],
    adult: json["adult"],
    backdropPath: json["backdrop_path"],
    originalLanguage: originalLanguageValues.map[json["original_language"]],
    originalTitle: json["original_title"],
    genreIds: new List<int>.from(json["genre_ids"].map((x) => x)),
    title: json["title"],
    voteAverage: json["vote_average"].toDouble(),
    overview: json["overview"],
    releaseDate:json["release_date"],
  );

  Map<String, dynamic> toJson() => {
    "popularity": popularity,
    "vote_count": voteCount,
    "video": video,
    "poster_path": posterPath,
    "id": id,
    "adult": adult,
    "backdrop_path": backdropPath,
    "original_language": originalLanguageValues.reverse[originalLanguage],
    "original_title": originalTitle,
    "genre_ids": new List<dynamic>.from(genreIds.map((x) => x)),
    "title": title,
    "vote_average": voteAverage,
    "overview": overview,
    "release_date": releaseDate
  };
}

enum OriginalLanguage { EN, TL, JA }

final originalLanguageValues = new EnumValues({
  "en": OriginalLanguage.EN,
  "ja": OriginalLanguage.JA,
  "tl": OriginalLanguage.TL
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}