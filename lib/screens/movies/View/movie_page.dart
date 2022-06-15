import 'package:film_fan/constants/colors.dart';
import 'package:film_fan/screens/movies/cubit/movie_cubit.dart';
import 'package:film_fan/screens/movies/widgets/render_movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static Route<HomePage> route() {
    return MaterialPageRoute<HomePage>(
      builder: (context) => const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) =>
            MovieCubit(movieRepository: context.read<MovieRepository>())
              ..fetchAllMovies(),
        child: const HomeView());
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final status = context.select((MovieCubit cubit) => cubit.state.status);
    final movies = context.select((MovieCubit cubit) => cubit.state.movieModel);
    switch (status) {
      case MovieStatus.initial:
        return const SizedBox(
          key: Key('initial'),
          child: Text('Loading...'),
        );
      case MovieStatus.loading:
        return const SizedBox(
          key: Key('loading'),
          child: Center(child: CircularProgressIndicator.adaptive()),
        );
      case MovieStatus.error:
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
      case MovieStatus.success:
        return Scaffold(
          backgroundColor: kPrimaryColor,
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
                      backgroundColor: kPrimaryColor,
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
                              color: kRedColor,
                            )
                          ],
                        ),
                      ),
                      bottom: TabBar(
                        labelColor: Theme.of(context).colorScheme.secondary,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: MaterialIndicator(
                          color: kRedColor,
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
                                Text('Favorites',
                                    style:
                                        Theme.of(context).textTheme.headline2),
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 20),
                                Container(
                                  constraints: BoxConstraints(
                                    minWidth:
                                        MediaQuery.of(context).size.width / 12,
                                    minHeight:
                                        MediaQuery.of(context).size.height / 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
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
                body: TabBarView(children: [
                  RenderMovies(
                    movies: movies,
                  ),
                  const Text('My favorite')
                ]),
              )),
        );
    }
  }
}
