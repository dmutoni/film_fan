part of 'credit_cubit.dart';

enum CreditStatus {
  initial,
  loading,
  success,
  failure,
}

class CreditState extends Equatable {
  const CreditState({
    this.status = CreditStatus.initial,
    this.credit,
  });

  final CreditStatus status;
  final Credit? credit;
  @override
  List<Object?> get props => [status, credit];
}

class CreditInitial extends CreditState {}
