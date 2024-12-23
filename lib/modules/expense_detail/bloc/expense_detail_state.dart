import 'package:equatable/equatable.dart';

abstract class ExpenseDetailState extends Equatable {
  const ExpenseDetailState();

  @override
  List<Object?> get props => [];
}

class ExpenseInitial extends ExpenseDetailState {}

class ExpenseLoading extends ExpenseDetailState {}

class ExpenseLoaded extends ExpenseDetailState {
  final Map<String, dynamic> expense;

  const ExpenseLoaded(this.expense);

  @override
  List<Object?> get props => [expense];
}

class ExpenseError extends ExpenseDetailState {
  final String message;

  const ExpenseError(this.message);

  @override
  List<Object?> get props => [message];
}

class ExpenseDeleted extends ExpenseDetailState {}
