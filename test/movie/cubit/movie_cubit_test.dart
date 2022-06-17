import 'package:film_fan/screens/movies/cubit/movie_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_api/movie_api.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:bloc_test/bloc_test.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  group("MoviesCubit", () {
    late MovieRepository movieRepository;
    final moviesModel = MovieModel(
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
      movieRepository = MockMovieRepository();
      when(() => movieRepository.fetchAllMovies())
          .thenAnswer((_) async => moviesModel);
    });
    test("initial state is correct", () {
      expect(MovieCubit(movieRepository: movieRepository).state,
          const MovieState(status: MovieStatus.initial));
    });
    group(".fetchAllMovies", () {
      blocTest<MovieCubit, MovieState>(
        'emits state when with update movies',
        build: () => MovieCubit(movieRepository: movieRepository),
        act: (cubit) => cubit.fetchAllMovies(),
        expect: () => [
          const MovieState(status: MovieStatus.loading),
          MovieState(status: MovieStatus.success, movieModel: moviesModel),
        ],
      );
      blocTest<MovieCubit, MovieState>(
        'emits error when repository throws exception',
        build: () {
          when(() => movieRepository.fetchAllMovies()).thenThrow(Exception());
          return MovieCubit(movieRepository: movieRepository);
        },
        act: (cubit) => cubit.fetchAllMovies(),
        expect: () => const [
          MovieState(status: MovieStatus.loading),
          MovieState(status: MovieStatus.error),
        ],
      );
    });
  });
}
