// lib/modules/view_expense/bloc/view_expense_event.dart

import 'package:equatable/equatable.dart';

abstract class ViewExpenseEvent extends Equatable {
  const ViewExpenseEvent();

  @override
  List<Object?> get props => [];
}

class LoadExpensesEvent extends ViewExpenseEvent {}
