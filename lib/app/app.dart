import 'package:film_fan/screens/splash_screen/splash.dart';
import 'package:film_fan/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key, required MovieRepository movieRepository})
      : _movieRepository = movieRepository,
        super(key: key);

  final MovieRepository _movieRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider.value(value: _movieRepository)],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      theme: defaultTheme,
      home: const SplashScreen(),
    );
  }
}
