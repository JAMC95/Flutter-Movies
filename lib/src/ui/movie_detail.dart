import 'package:flutter/cupertino.dart';

class MovieDetail extends StatefulWidget {
  final posterUrl;
  final descripcion;
  final releaseDate;
  final String title;
  final String voteAverage;
  final int movieId;

  MovieDetail({
    this.title,
    this.posterUrl,
    this.descripcion,
    this.releaseDate,
    this.voteAverage,
    this.movieId
  });

  @override
  _MovieDetailState createState() => _MovieDetailState(
    title: title,
    posterUrl: posterUrl,
    descripcion: descripcion,
    releaseDate: releaseDate,
    voteAverage: voteAverage,
    movieId: movieId
  );
}

class _MovieDetailState extends State<MovieDetail> {
  final posterUrl;
  final descripcion;
  final releaseDate;
  final String title;
  final String voteAverage;
  final int movieId;

  _MovieDetailState({
    this.title,
    this.posterUrl,
    this.descripcion,
    this.releaseDate,
    this.voteAverage,
    this.movieId
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
