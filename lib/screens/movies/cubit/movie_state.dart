part of 'movie_cubit.dart';

enum MovieStatus {
  initial,
  loading,
  success,
  error,
}

class MovieState extends Equatable {
  const MovieState({this.status = MovieStatus.initial, this.movieModel});

  final MovieStatus status;
  final MovieModel? movieModel;
  @override
  List<Object?> get props => [status, movieModel];
}

class MovieInitial extends MovieState {}
