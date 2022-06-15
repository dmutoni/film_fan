import 'package:film_fan/constants/colors.dart';
import 'package:film_fan/screens/movie_details/widgets/movie_details_hero.dart';
import 'package:flutter/material.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage(
      {Key? key,
      this.movieTitle,
      this.moviePoster,
      this.movieReleaseDate,
      this.movieVoteAverage,
      this.movieRating,
      this.movieOverview,
      this.movieGenres,
      this.rating})
      : super(key: key);

  final String? movieTitle;
  final String? moviePoster;
  final String? movieReleaseDate;
  final String? movieVoteAverage;
  final String? movieRating;
  final String? movieOverview;
  final List<int>? movieGenres;
  final int? rating;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: kLightGreen,
              pinned: true,
              leading: IconButton(
                icon: const Icon(
                  Icons.keyboard_arrow_left_outlined,
                  size: 30,
                  color: Colors.black,
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
                  name: movieTitle,
                  genre: movieGenres.toString(),
                  moviePoster: moviePoster)
            ]))
          ],
        ));
  }
}
