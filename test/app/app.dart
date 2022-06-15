import 'package:flutter_test/flutter_test.dart';

import '../helpers/helpers.dart';

class MockPokemonsRepository extends Mock implements MockMovieRepository {}

void main() {
  late PokemonRepository pokemonsRepository;

  setUp(() {
    pokemonsRepository = MockPokemonsRepository();
  });

  group("App", () {
    testWidgets("renders AppView", (tester) async {
      await tester.pumpWidget(
        App(pokemonRepository: pokemonsRepository),
      );
      await tester.pump(const Duration(seconds: 2));
      expect(find.byType(AppView), findsOneWidget);
    });
  });

  group('AppView', () {
    testWidgets('renders Splash screen', (tester) async {
      await tester.pumpApp(const AppView(),
          pokemonsRepository: pokemonsRepository);

      await tester.pump(const Duration(seconds: 2));
      expect(find.byType(SplashScreen), findsOneWidget);
    });
  });
}
