import 'package:equatable/equatable.dart';

abstract class ExpenseDetailEvent extends Equatable {
  const ExpenseDetailEvent();

  @override
  List<Object?> get props => [];
}

class LoadExpenseEvent extends ExpenseDetailEvent {
  final int expenseId;

  const LoadExpenseEvent({required this.expenseId});

  @override
  List<Object?> get props => [expenseId];
}

class DeleteExpenseEvent extends ExpenseDetailEvent {
  final int expenseId;

  const DeleteExpenseEvent({required this.expenseId});

  @override
  List<Object?> get props => [expenseId];
}
