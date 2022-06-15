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
    } catch (error) {
      throw MovieException();
    }
  }

  Future<void> rateMovie(int id, int value) {
    try {
      return _movieApiClient.rateMovie(
        id: id,
        value: value,
      );
    } catch (error) {
      throw MovieException();
    }
  }

  Future<MovieDetail>? searchMovies(int id) {
    try {
      return _movieApiClient.getOneMovieDetails(id);
    } on Exception {
      throw SearchException();
    }
  }
}
