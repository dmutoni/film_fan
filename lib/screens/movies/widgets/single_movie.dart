import 'package:film_fan/constants/colors.dart';
import 'package:film_fan/screens/movie_details/View/movie_details.dart';
import 'package:flutter/material.dart';

class SingleMovie extends StatelessWidget {
  final String? title;
  final String? releaseDate;
  final String? voteAverage;
  final String? moviePoster;
  final String? rating;
  final List<int>? genre;

  const SingleMovie(
      {Key? key,
      this.title,
      this.releaseDate,
      this.voteAverage,
      this.moviePoster,
      this.rating,
      this.genre})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetailsPage(
              movieTitle: title,
              movieGenres: genre,
              movieOverview: voteAverage,
              moviePoster: moviePoster,
              movieRating: rating,
              movieReleaseDate: releaseDate,
              movieVoteAverage: voteAverage,
            ),
          ),
        );
      },
      child: Container(
        key: const Key('movie_View_Success'),
        decoration: const BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5,
              width: double.infinity,
              color: kGreyColor,
              child: Image.network(
                  'https://image.tmdb.org/t/p/w500/' + moviePoster!),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text(title!, style: Theme.of(context).textTheme.bodyText2),
                  Text(
                    releaseDate!,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(height: 8),
                  Text(voteAverage!,
                      style: Theme.of(context).textTheme.bodyText2),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
