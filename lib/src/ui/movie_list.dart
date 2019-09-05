import 'package:flutter/material.dart';
import 'package:movies_app/src/models/movie_item.dart';
import 'package:movies_app/src/resources/movie_api_provider.dart';
import 'package:movies_app/src/ui/movie_detail.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  MovieApiProvider api;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
    api = new MovieApiProvider();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<MovieItem>(
          future: api.getMovieList(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
             return buildMovieGrid(snapshot);
            } else if(snapshot.hasError){
                return Text(snapshot.error.toString());
            }

            return Center(
              child: CircularProgressIndicator()
            );
          }
      )
    );
  }

  Widget buildMovieGrid(AsyncSnapshot<MovieItem> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.results.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.7),
        itemBuilder: (BuildContext context, int index) {
            return GridTile(
              child: InkResponse(
                enableFeedback: true,
                child:  Image.network('https://image.tmdb.org/t/p/w185${snapshot.data.results[index]
                        .posterPath}',
                        fit: BoxFit.cover),
                onTap: () => openDetailPelicula(snapshot.data, index),
              ),
              

            );
        }
    );
  }

  openDetailPelicula(MovieItem data, int index) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (contex) {
          return MovieDetail(
            title: data.results[index].title,
            posterUrl: data.results[index].posterPath,
            descripcion: data.results[index].overview,
            releaseDate: data.results[index].releaseDate,
            voteAverage: data.results[index].voteAverage.toString(),
            movieId: data.results[index].id
          );
        })
      );
  }
}
