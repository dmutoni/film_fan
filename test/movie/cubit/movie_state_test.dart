import 'package:film_fan/screens/movies/cubit/movie_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("MovieState", () {
    test('Supports value comparison', () {
      expect(const MovieState(status: MovieStatus.success, movieModel: null),
          const MovieState(status: MovieStatus.success, movieModel: null));
    }); //
  });
}
