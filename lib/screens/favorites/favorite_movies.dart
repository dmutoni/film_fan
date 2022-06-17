import 'package:film_fan/screens/movies/widgets/single_movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';

class FavoriteMovies extends StatelessWidget {
  const FavoriteMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocalStorage storage = LocalStorage('movie_fan');
    _readInfo() async {
      final movies = await storage.getItem('movies');
      print(movies);
    }

    return const SingleMovie(id: 21, title: 'Movie Title');
  }
}
