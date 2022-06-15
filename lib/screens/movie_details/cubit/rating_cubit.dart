import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_repository/movie_repository.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit(
      {int? id, required MovieRepository movieRepository, required int value})
      : _id = id,
        _movieRepository = movieRepository,
        _value = value,
        super(const RatingState());
  final int? _id;
  final MovieRepository _movieRepository;
  final int? _value;

  Future<void> rateMovie() async {
    emit(const RatingState(status: RatingStatus.loading));

    try {
      await _movieRepository.rateMovie(_id!, _value!);
      emit(const RatingState(status: RatingStatus.success));
    } on Exception {
      emit(const RatingState(
        status: RatingStatus.failure,
      ));
    }
  }
}
