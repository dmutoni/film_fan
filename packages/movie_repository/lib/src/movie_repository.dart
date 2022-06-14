import 'package:movie_api/movie_api.dart';

class MovieException implements Exception {}

class SearchException implements Exception {}

class MovieRepository {
  MovieRepository({MovieApiClient? movieApiClient})
      : _movieApiClient = movieApiClient ?? MovieApiClient();

  final MovieApiClient _movieApiClient;

  Future<MovieModel>? fetchAllMovies() {
    try {
      return _movieApiClient.fetchAllMovies();
    } on Exception {
      throw MovieException();
    }
  }
  // Future<MovieModel>? searchMovies(String query) {
  //   try {
  //     return _movieApiClient.(query);
  //   } on Exception {
  //     throw SearchException();
  //   }
  // }
}
