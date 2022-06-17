import 'package:film_fan/screens/movie_details/View/movie_details.dart';
import 'package:film_fan/screens/movie_details/cubit/movie_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:movie_api/movie_api.dart';
import 'package:movie_repository/movie_repository.dart';

class MockMovieDetailsPageCubit extends MockCubit<MovieDetailsState>
    implements MovieDetailsCubit {}

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  final movie = MovieDetail(
      posterPath: "/6JjfSchsU6daXk2AKX8EEBjO3Fm.jpg",
      adult: false,
      overview:
          "Dangerously ill with a rare blood disorder, and determined to save others suffering his same fate, Dr. Michael Morbius attempts a desperate gamble. What at first appears to be a radical success soon reveals itself to be a remedy potentially worse than the disease.",
      releaseDate: "2022-03-30",
      genres: List.generate(1, (index) => Genre(name: "Bbich", id: 12)),
      id: 526896,
      originalTitle: "en",
      originalLanguage: "Morbius",
      title: "Morbius",
      backdropPath: "/kmCBLNHsNnlDEtghSaF2nabpG2T.jpg",
      popularity: 3124.049,
      voteCount: 1677,
      video: false,
      voteAverage: 6.5,
      budget: 75000,
      homepage: "https://www.morbius.movie/",
      imdbId: "tt510");
  setUpAll(() {
    registerFallbackValue(MovieDetailsState(movieDetails: movie));
  });
  group("MovieDetailPage", () {
    setUp(() {});
    test("has route", () {
      expect(MovieDetailsPage.route(526896), isA<MaterialPageRoute<void>>());
    });
  });
}
