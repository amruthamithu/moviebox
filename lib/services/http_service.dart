import 'dart:convert';
import 'package:http/http.dart';
import 'package:moviebox/models/movie_list.dart';

class HttpService {
  final String moviesURL =
      "https://api-telly-tell.herokuapp.com/movies/rahul.verma";

  Future<List<MovieDetails>> getMovies() async {
    Response res = await get(Uri.parse(moviesURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<MovieDetails> movies = body
          .map(
            (dynamic item) => MovieDetails.fromJson(item),
          )
          .toList();

      return movies;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
