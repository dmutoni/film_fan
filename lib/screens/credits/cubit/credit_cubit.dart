import 'package:bloc/bloc.dart';
import 'package:credits_api/credits_api.dart';
import 'package:credits_repository/credits_repository.dart';
import 'package:equatable/equatable.dart';

part 'credit_state.dart';

class CreditCubit extends Cubit<CreditState> {
  CreditCubit({int? id, required CreditRepository creditRepository})
      : _creditsRepository = creditRepository,
        _id = id,
        super(const CreditState());
  final CreditRepository _creditsRepository;
  final int? _id;
  Future<void> fetchCredit() async {
    emit(CreditState(status: CreditStatus.loading, credit: state.credit));
    try {
      final credit = await _creditsRepository.getActors(_id!);
      emit(CreditState(status: CreditStatus.success, credit: credit));
    } on Exception {
      emit(CreditState(status: CreditStatus.failure, credit: state.credit));
    }
  }
}
