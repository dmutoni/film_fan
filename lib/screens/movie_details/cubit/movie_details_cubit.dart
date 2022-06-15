import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_api/movie_api.dart';
import 'package:movie_repository/movie_repository.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit({int? id, required MovieRepository movieRepository})
      : _movieRepository = movieRepository,
        _id = id,
        super(const MovieDetailsState());

  final MovieRepository _movieRepository;
  final int? _id;

  Future<void> fetchMovieDetails() async {
    emit(MovieDetailsState(
        status: MovieDetailsStatus.loading, movieDetails: state.movieDetails));

    try {
      final movieDetails = await _movieRepository.searchMovies(_id!);
      emit(MovieDetailsState(
          status: MovieDetailsStatus.success, movieDetails: movieDetails));
    } on Exception {
      emit(MovieDetailsState(
          status: MovieDetailsStatus.failure,
          movieDetails: state.movieDetails));
    }
  }
}
