// lib/modules/view_expense/bloc/view_expense_state.dart

import 'package:equatable/equatable.dart';

abstract class ViewExpenseState extends Equatable {
  const ViewExpenseState();

  @override
  List<Object?> get props => [];
}

class ViewExpenseInitial extends ViewExpenseState {}

class ViewExpenseLoading extends ViewExpenseState {}

class ViewExpenseLoaded extends ViewExpenseState {
  final List<Map<String, dynamic>> expenses;

  const ViewExpenseLoaded(this.expenses);

  @override
  List<Object?> get props => [expenses];
}

class ViewExpenseError extends ViewExpenseState {
  final String message;

  const ViewExpenseError(this.message);

  @override
  List<Object?> get props => [message];
}
