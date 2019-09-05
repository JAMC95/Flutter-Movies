import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/src/models/movie_item.dart';

class MovieApiProvider {
  final _apiKey = "e89f9f7cbba267b8c7025fc06a1bb120";
  final _baseUrl = "https://api.themoviedb.org/3";

  Future<MovieItem> getMovieList() async{
    final urlPopularMovies = '${_baseUrl}/movie/popular?api_key=${_apiKey}';

    final response = await http.get(urlPopularMovies);

    if(response.statusCode == 200) {
      MovieItem.fromJson(json.decode(response.body));
    } else {
      throw Exception('Fallo al obetener el listado de películas');
    }
  }

}

