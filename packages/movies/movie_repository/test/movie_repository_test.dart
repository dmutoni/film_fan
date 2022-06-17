import 'package:movie_api/movie_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_repository/movie_repository.dart';

class MockMovieHttpClient extends Mock implements MovieApiClient {}

void main() {
  group('MovieRepository', () {
    late MovieApiClient movieApiClient;
    late MovieRepository subject;
    final movies = MovieModel(
        page: 1,
        results: List.generate(
            1,
            (index) => const Movie(
                  id: 338953,
                  title: "Batman v Superman: Dawn of Justice",
                  posterPath: "/cGOPbv9wA5gEejkL9MBhT2jvN9X.jpg",
                  overview:
                      "Fearing the actions of a god-like Super Hero left unchecked, Gotham City’s own formidable, forceful vigilante takes on Metropolis’s most revered, modern-day savior, while the world wrestles with what sort of hero it really needs. And with Batman and Superman at war with one another, a new threat quickly arises, putting mankind in greater danger than it’s ever known before.",
                  releaseDate: "2016-03-23",
                  backdropPath: "/zGLHX92Gk96O1DJvLil7ObJTbaL.jpg",
                  voteAverage: 5.9,
                  voteCount: 589,
                  adult: false,
                  genreIds: [28, 12, 14, 35, 878],
                  originalLanguage: "en",
                  popularity: 5.8,
                  video: false,
                  originalTitle: "Batman v Superman: Dawn of Justice",
                )));
    setUp(() {
      movieApiClient = MockMovieHttpClient();
      when(() => movieApiClient.fetchAllMovies())
          .thenAnswer((_) async => movies);

      subject = MovieRepository(movieApiClient: movieApiClient);
    });
    test('constructor returns normally', () {
      expect(
        () => MovieRepository(),
        returnsNormally,
      );
    });
    group('.fetchAllMovies', () {
      test('throws MoviesException when api throws an exception', () async {
        when(() => movieApiClient.fetchAllMovies()).thenThrow(Exception());

        expect(
          () => subject.fetchAllMovies(),
          throwsA(isA<MovieException>()),
        );

        verify(() => movieApiClient.fetchAllMovies()).called(1);
      });

      test('makes correct request', () async {
        await subject.fetchAllMovies();

        verify(() => movieApiClient.fetchAllMovies()).called(1);
      });
    });
  });
}
