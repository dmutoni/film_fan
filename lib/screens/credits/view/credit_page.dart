import 'package:credits_api/credits_api.dart';
import 'package:credits_repository/credits_repository.dart';
import 'package:film_fan/screens/credits/cubit/credit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreditPage extends StatelessWidget {
  final int? id;
  const CreditPage({Key? key, this.id}) : super(key: key);

  static Route<CreditPage> route(int id) {
    return MaterialPageRoute(
      builder: (context) => CreditPage(id: id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreditCubit(
          id: id, creditRepository: context.read<CreditRepository>())
        ..fetchCredit(),
      child: const CreditView(),
    );
  }
}

class CreditView extends StatelessWidget {
  const CreditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  final String? id;
  const _Content({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final status = context.select((CreditCubit cubit) => cubit.state.status);
    final credits = context.select((CreditCubit cubit) => cubit.state.credit);
    switch (status) {
      case CreditStatus.initial:
        return const SizedBox(
          key: Key('initial'),
          child: Text('Loading...'),
        );
      case CreditStatus.loading:
        return const SizedBox(
          key: Key('loading'),
          child: Center(child: CircularProgressIndicator.adaptive()),
        );
      case CreditStatus.failure:
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
      case CreditStatus.success:
        final List<Cast>? cast = credits!.cast;
        return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: ListView(
              shrinkWrap: true,
              children: [
                const Text('Cast',
                    style: TextStyle(fontSize: 20, color: Colors.black)),
                ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: const Icon(Icons.list),
                        title: Text(cast![index].name!),
                        subtitle: Text(cast[index].character!),
                      );
                    },
                    itemCount: cast?.length),
              ],
            ));
    }
  }
}
