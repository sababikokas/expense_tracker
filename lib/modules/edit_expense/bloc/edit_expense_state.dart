import 'package:equatable/equatable.dart';

abstract class EditExpenseState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EditExpenseInitial extends EditExpenseState {}

class EditExpenseLoading extends EditExpenseState {}

class EditExpenseLoaded extends EditExpenseState {
  final Map<String, dynamic> expense;

  EditExpenseLoaded({required this.expense});

  @override
  List<Object?> get props => [expense];
}

class ExpenseUpdated extends EditExpenseState {}

class EditExpenseError extends EditExpenseState {
  final String message;

  EditExpenseError({required this.message});

  @override
  List<Object?> get props => [message];
}
