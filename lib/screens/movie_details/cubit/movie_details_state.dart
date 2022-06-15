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
  final MovieDetailModel? movieDetails;
  @override
  List<Object> get props => [];
}
