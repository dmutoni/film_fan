import 'package:film_fan/constants/colors.dart';
import 'package:flutter/material.dart';

class MovieDetailsHero extends StatelessWidget {
  final String? name;
  final String? releaseDate;
  final String? moviePoster;

  const MovieDetailsHero(
      {Key? key, this.name, this.releaseDate, this.moviePoster})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      height: MediaQuery.of(context).size.height / 4,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2,
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name!,
                      style: Theme.of(context).textTheme.headline1,
                      overflow: TextOverflow.visible,
                    ),
                    Text(
                      'Year: ${releaseDate?.split("-")[0]}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 5,
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500/' + moviePoster!,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
