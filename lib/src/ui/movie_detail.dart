import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 200.0,
                  elevation: 0.0,
                  floating: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network('https://image.tmdb.org/t/p/w500${posterUrl}',
                    fit : BoxFit.cover
                    )
                  ),
                )
              ];
            },
            body: Container(child: Text(title),)),
      )
    );
  }
}
