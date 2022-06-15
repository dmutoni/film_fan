import 'dart:async';
import 'dart:developer';

import 'package:film_fan/app/app.dart';
import 'package:flutter/material.dart';
import 'package:movie_repository/movie_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  final movieRepository = MovieRepository();
  runZonedGuarded(
      () => runApp(App(
            movieRepository: movieRepository,
          )), (error, stackTrace) {
    log(error.toString(), stackTrace: stackTrace);
  });
}
