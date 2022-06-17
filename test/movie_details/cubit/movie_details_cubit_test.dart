import 'package:film_fan/screens/movie_details/cubit/movie_details_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_repository/movie_repository.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  group("MovieDetailsCubit", () {
    late MovieRepository movieRepository;
    setUp(() {
      movieRepository = MockMovieRepository();
    });
    test("initial state is correct", () {
      expect(MovieDetailsCubit(movieRepository: movieRepository).state,
          equals(const MovieDetailsState()));
    });
  });
}
