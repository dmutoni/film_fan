part of 'rating_cubit.dart';

enum RatingStatus { initial, loading, success, failure }

class RatingState extends Equatable {
  const RatingState({this.status = RatingStatus.initial});
  final RatingStatus status;
  @override
  List<Object> get props => [status];
}
