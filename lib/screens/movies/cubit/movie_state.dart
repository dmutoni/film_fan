part of 'movie_cubit.dart';

enum MovieState {
  initial,
  loading,
  loaded,
  error,
}

abstract class MovieState extends Equatable {
  const MovieState({this.status = MovieStatus.initial, this.movieModel});

  final MovieStatus status;
  final MovieModel? movieModel;
  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}
