import 'package:credits_repository/credits_repository.dart';
import 'package:film_fan/app/app.dart';
import 'package:film_fan/screens/splash_screen/view/splash_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_repository/movie_repository.dart';

import '../helpers/helpers.dart';

class MockMoviesRepository extends Mock implements MockMovieRepository {}

class MockCreditsRepository extends Mock implements MockCreditRepository {}

void main() {
  late MovieRepository movieRepository;
  late CreditRepository creditRepository;

  setUp(() {
    movieRepository = MovieRepository();
    creditRepository = CreditRepository();
  });

  group("App", () {
    testWidgets("renders AppView", (tester) async {
      await tester.pumpWidget(
        App(
          movieRepository: movieRepository,
          creditRepository: creditRepository,
        ),
      );
      await tester.pump(const Duration(seconds: 2));
      expect(find.byType(AppView), findsOneWidget);
    });
  });

  group('AppView', () {
    testWidgets('renders Splash screen', (tester) async {
      await tester.pumpApp(const AppView(),
          creditRepository: creditRepository, movieRepository: movieRepository);

      await tester.pump(const Duration(seconds: 2));
      expect(find.byType(SplashScreen), findsOneWidget);
    });
  });
}
