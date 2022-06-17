import 'package:film_fan/constants/colors.dart';
import 'package:film_fan/screens/movie_details/cubit/movie_details_cubit.dart';
import 'package:film_fan/screens/movie_details/cubit/rating_cubit.dart';
import 'package:film_fan/screens/movie_details/widgets/movie_details_hero.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localstorage/localstorage.dart';
import 'package:movie_api/movie_api.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../credits/view/credit_page.dart';

class MovieDetailsPage extends StatelessWidget {
  final int? id;
  const MovieDetailsPage({Key? key, this.id}) : super(key: key);

  static Route<MovieDetailsPage> route(int id) {
    return MaterialPageRoute(
      builder: (context) => MovieDetailsPage(id: id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => MovieDetailsCubit(
            id: id, movieRepository: context.read<MovieRepository>())
          ..fetchMovieDetails(),
        child: const MovieDetailsView());
  }
}

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: _Content());
  }
}

class _Content extends StatefulWidget {
  final String? id;

  const _Content({Key? key, this.id}) : super(key: key);

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  final LocalStorage storage = LocalStorage('movie_fan');
  bool _hasBeenPressed = false;

  @override
  void initState() {
    super.initState();
  }

  _addInfo(movie) async {
    if (!_hasBeenPressed) {
      _hasBeenPressed = true;
      await storage.setItem('movie_${movie.id}', movie.toJson());
    }
  }

  _removeMovieFromStorage(movie) async {
    await storage.deleteItem('movie_${movie.id}');
  }

  @override
  Widget build(BuildContext context) {
    final status =
        context.select((MovieDetailsCubit cubit) => cubit.state.status);
    final movie =
        context.select((MovieDetailsCubit cubit) => cubit.state.movieDetails);
    switch (status) {
      case MovieDetailsStatus.initial:
        return const SizedBox(
          key: Key('initial'),
          child: Text('Loading...'),
        );
      case MovieDetailsStatus.loading:
        return const SizedBox(
          key: Key('loading'),
          child: Center(child: CircularProgressIndicator.adaptive()),
        );
      case MovieDetailsStatus.failure:
        return const Center(
          key: Key("pokemonsView_failure_text"),
          child: Text(
            "Failed to load pokemons",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      case MovieDetailsStatus.success:
        return Scaffold(
          backgroundColor: kPrimaryColor,
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: kPrimaryColor,
                pinned: true,
                leading: IconButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_left_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                elevation: 0,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(4),
                  child: Container(
                    color: kLightGreyColor,
                    height: 2,
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                MovieDetailsHero(
                    name: movie?.title,
                    releaseDate: movie?.releaseDate,
                    moviePoster: movie?.posterPath),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      Row(
                        children: movie!.genres!
                            .map((e) => Container(
                                color: kRedColor,
                                padding: const EdgeInsets.all(12),
                                margin: const EdgeInsets.only(right: 8),
                                child: Text(
                                  e.name!,
                                  style: const TextStyle(color: kWhiteColor),
                                )))
                            .toList(),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Overview',
                            style: Theme.of(context).textTheme.headline2),
                        const SizedBox(height: 10),
                        Text(movie.overview ?? '',
                            style: Theme.of(context).textTheme.headline4),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      Text('Ratings',
                          style: Theme.of(context).textTheme.headline2),
                      const SizedBox(width: 10),
                      Text(movie.voteAverage!.toString(),
                          style: Theme.of(context).textTheme.headline4),
                    ],
                  ),
                ),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  unratedColor: kWhiteColor,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    RatingCubit(
                        id: movie.id,
                        value: rating.round(),
                        movieRepository: context.read<MovieRepository>());
                  },
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  padding: const EdgeInsets.all(16),
                  child: CreditPage(id: movie.id),
                )
              ])),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                _hasBeenPressed = !_hasBeenPressed;
              });
              if (_hasBeenPressed) {
                _addInfo(MovieDetail(
                    id: movie.id,
                    title: movie.title,
                    posterPath: movie.posterPath,
                    releaseDate: movie.releaseDate,
                    overview: movie.overview,
                    genres: movie.genres,
                    voteAverage: movie.voteAverage));
              } else {
                _removeMovieFromStorage(movie);
              }
            },
            label: _hasBeenPressed
                ? const Text(
                    'Remove from favorite',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: kWhiteColor),
                  )
                : const Text(
                    'Mark as favorite',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: kWhiteColor),
                  ),
            backgroundColor: _hasBeenPressed
                ? Theme.of(context).colorScheme.primary
                : kRedColor,
          ),
        );
    }
  }
}
