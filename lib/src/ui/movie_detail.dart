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
            body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(title, style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                    )),
                    Container(
                      margin: EdgeInsets.only(top: 8.0),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                            Icons.star_border,
                            color: Colors.blue
                        ),
                        Text(
                            voteAverage,
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.blue
                        )
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 10.0),
                        ),
                        Text(
                            releaseDate.toString(),
                            style: TextStyle(
                                fontSize: 18.0,
                                fontStyle: FontStyle.italic
                            )
                        )
                      ],
                    ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                ),
                    Text(descripcion)
                  ],
                ),
            )
        ),
      )
    );
  }
}
