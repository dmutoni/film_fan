import 'package:film_fan/screens/movie_details/cubit/movie_details_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("MovieDetailsState", () {
    test("Supports value comparison", () {
      expect(
          const MovieDetailsState(
              status: MovieDetailsStatus.success, movieDetails: null),
          const MovieDetailsState(
              status: MovieDetailsStatus.success, movieDetails: null));
    }); //
  });
}
