part of 'movie_details_cubit.dart';

enum MovieDetailsStatus {
  initial,
  loading,
  success,
  failure,
}

class MovieDetailsState extends Equatable {
  const MovieDetailsState(
      {this.status = MovieDetailsStatus.initial, this.movieDetails});
  final MovieDetailsStatus status;
  final MovieDetail? movieDetails;
  @override
  List<Object?> get props => [status, movieDetails];
}
