import 'package:film_fan/screens/movies/cubit/movie_cubit.dart';
import 'package:film_fan/screens/movies/widgets/single_movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:movie_api/movie_api.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class RenderMovies extends StatelessWidget {
  const RenderMovies({Key? key, this.movies}) : super(key: key);

  final MovieModel? movies;

  @override
  Widget build(BuildContext context) {
    movies!.results!.sort((a, b) => a.title!.compareTo(b.title!));
    return LazyLoadScrollView(
      child: ResponsiveGridList(
        horizontalGridMargin: 10,
        verticalGridMargin: 2,
        minItemWidth: 112,
        children: List.generate(movies!.results!.length, (index) {
          final movie = movies!.results?[index];
          return SingleMovie(
            id: movie?.id,
            title: movie?.title,
            releaseDate: movie?.releaseDate,
            voteAverage: movie?.voteAverage.toString(),
            moviePoster: movie?.posterPath,
            rating: movie?.voteAverage.toString(),
            genre: movie?.genreIds,
            overview: movie?.overview,
          );
        }),
      ),
      onEndOfPage: () => {context.read<MovieCubit>().fetchAllMovies()},
    );
  }
}
