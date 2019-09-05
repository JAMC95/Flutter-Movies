import 'package:flutter/material.dart';
import 'package:movies_app/src/models/movie_item.dart';
import 'package:movies_app/src/resources/movie_api_provider.dart';

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
      appBar: AppBar(
        title: Text('Popular movies')
      ),
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
              child: Text('${snapshot.data.results[index].title}'),
            );
        }
    );
  }
}
