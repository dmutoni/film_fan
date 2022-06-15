import 'package:film_fan/constants/colors.dart';
import 'package:film_fan/screens/movies/widgets/single_movie.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  toolbarHeight: 70,
                  pinned: true,
                  automaticallyImplyLeading: false,
                  backgroundColor: kWhiteColor,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 10),
                            Text(
                              'Film fan',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 2,
                          color: kBlackColor,
                        )
                      ],
                    ),
                  ),
                  bottom: TabBar(
                    labelColor: Theme.of(context).colorScheme.secondary,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: MaterialIndicator(
                      color: Theme.of(context).colorScheme.primary,
                      height: 5,
                      topLeftRadius: 8,
                      topRightRadius: 8,
                    ),
                    labelStyle: const TextStyle(fontSize: 18),
                    tabs: [
                      Tab(
                        icon: Text(
                          'All Movies',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      Tab(
                        icon: Row(
                          children: [
                            Text('Favourites',
                                style: Theme.of(context).textTheme.headline2),
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 20),
                            Container(
                              constraints: BoxConstraints(
                                minWidth:
                                    MediaQuery.of(context).size.width / 12,
                                minHeight:
                                    MediaQuery.of(context).size.height / 12,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Text(
                                  '1',
                                  style: TextStyle(color: kWhiteColor),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ];
            },
            body: const TabBarView(children: [
              SingleMovie(
                moviePoster:
                    'https://www.themoviedb.org/t/p/w220_and_h330_face/ekZobS8isE6mA53RAiGDG93hBxL.jpg',
                releaseDate: '22/01/2022',
                title: '365 days',
                voteAverage: '21',
              ),
              Text('My favourite')
            ]),
          )),
    );
  }
}
