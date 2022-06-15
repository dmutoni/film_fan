import 'dart:async';
import 'dart:developer';

import 'package:credits_repository/credits_repository.dart';
import 'package:film_fan/app/app.dart';
import 'package:flutter/material.dart';
import 'package:movie_repository/movie_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  final movieRepository = MovieRepository();
  final creditRepository = CreditRepository();
  runZonedGuarded(
      () => runApp(App(
            movieRepository: movieRepository,
            creditRepository: creditRepository,
          )), (error, stackTrace) {
    log(error.toString(), stackTrace: stackTrace);
  });
}
