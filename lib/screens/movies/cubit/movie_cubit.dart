import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_api/movie_api.dart';
import 'package:movie_repository/movie_repository.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit({required MovieRepository movieRepository})
      : _movieRepository = movieRepository,
        super(const MovieState());
  final MovieRepository _movieRepository;

  Future<void> fetchAllMovies() async {
    emit(MovieState(status: MovieStatus.loading, movieModel: state.movieModel));
    try {
      final movies = await _movieRepository.fetchAllMovies();
      emit(MovieState(status: MovieStatus.success, movieModel: movies));
    } catch (e) {
      emit(MovieState(status: MovieStatus.error, movieModel: state.movieModel));
    }
  }
}
