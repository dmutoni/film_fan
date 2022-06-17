import 'package:film_fan/screens/movies/View/movie_page.dart';
import 'package:film_fan/screens/movies/cubit/movie_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:movie_api/movie_api.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

class MockMoviesRepository extends Mock implements MovieRepository {}

class MockMovieCubit extends MockCubit<MovieState> implements MovieCubit {}

void main() {
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
  group("MoviesPage", () {
    late MovieRepository movieRepository;
    setUp(() {
      movieRepository = MockMoviesRepository();
      when(() => movieRepository.fetchAllMovies())
          .thenAnswer((_) async => moviesModel);
    });
    test(
      'has route',
      () {
        expect(HomePage.route(), isA<MaterialPageRoute<void>>());
      },
    );
    testWidgets("Renders HomeView", (tester) async {
      await tester.pumpApp(
        Navigator(
          onGenerateRoute: (_) => HomePage.route(),
        ),
        movieRepository: movieRepository,
      );
      expect(find.byType(HomeView), findsOneWidget);
    });
    group("HomeView", () {
      late MovieCubit movieCubit;
      late MockNavigator navigator;

      setUp(() {
        movieCubit = MockMovieCubit();
        navigator = MockNavigator();
        when(() => navigator.push(any(that: isRoute<void>())))
            .thenAnswer((_) async {
          return null;
        });
      });
      setUpAll(() {
        registerFallbackValue(const MovieState());
      });
      void ignoreOverflowErrors() {
        FlutterError.onError = (FlutterErrorDetails details) {
          final exception = details.exception;
          final isOverflowError = exception is FlutterError &&
              !exception.diagnostics.any((e) =>
                  e.value.toString().startsWith("A renderFlex overflowed by"));
          if (details.exception is AssertionError) {
            return;
          }
          if (!isOverflowError) {
            FlutterError.presentError(details);
          }
        };
      }

      testWidgets("renders empty page when status initial", (tester) async {
        const key = Key("movieView_initial_sizedBox");
        when(() => movieCubit.state).thenReturn(const MovieState());
        await tester.pumpApp(BlocProvider.value(
          value: movieCubit,
          child: const HomeView(),
        ));
        expect(find.byKey(key), findsOneWidget);
      });

      testWidgets('renders error text when status is failure', (tester) async {
        const key = Key('movieView_error_indicator');

        when(() => movieCubit.state).thenReturn(
          const MovieState(status: MovieStatus.error),
        );

        await tester.pumpApp(
          BlocProvider.value(
            value: movieCubit,
            child: const HomeView(),
          ),
        );

        expect(find.byKey(key), findsOneWidget);
      });
      testWidgets('renders list of movies when status is success',
          (tester) async {
        const key = Key('movieView_success_scaffold');

        when(() => movieCubit.state).thenReturn(
          MovieState(status: MovieStatus.success, movieModel: moviesModel),
        );

        ignoreOverflowErrors();

        await tester.pumpApp(
          BlocProvider.value(
            value: movieCubit,
            child: const HomeView(),
          ),
        );
        expect(find.byKey(key), findsOneWidget);
        expect(find.byType(LazyLoadScrollView),
            findsNWidgets(moviesModel.results!.length));
      });
    });
  });
}
