import 'package:film_fan/constants/colors.dart';
import 'package:flutter/material.dart';

class SingleMovie extends StatelessWidget {
  final String title;
  final String releaseDate;
  final String voteAverage;
  final String moviePoster;
  const SingleMovie(
      {Key? key,
      required this.title,
      required this.releaseDate,
      required this.voteAverage,
      required this.moviePoster})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => PokemonDetailsPage(name: name),
        //   ),
        // );
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
              height: MediaQuery.of(context).size.height / 7,
              width: double.infinity,
              color: kGreyColor,
              child: Image.network(moviePoster),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text(title, style: Theme.of(context).textTheme.bodyText2),
                  Text(
                    releaseDate,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(height: 8),
                  Text(voteAverage,
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
