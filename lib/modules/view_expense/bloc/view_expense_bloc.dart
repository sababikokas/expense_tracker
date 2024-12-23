// lib/modules/view_expense/bloc/view_expense_bloc.dart

import 'package:bloc/bloc.dart';
import 'package:expense_tracker/modules/view_expense/bloc/view_expense_state.dart';
import 'package:expense_tracker/modules/view_expense/bloc/view_expnse_event.dart';
import 'package:expense_tracker/modules/view_expense/repo/view_expense_repository.dart';

class ViewExpenseBloc extends Bloc<ViewExpenseEvent, ViewExpenseState> {
  final ViewExpenseRepository _repository;

  ViewExpenseBloc(this._repository) : super(ViewExpenseInitial()) {
    on<LoadExpensesEvent>((event, emit) async {
      emit(ViewExpenseLoading());
      try {
        final expenses = await _repository.getExpenses();
        emit(ViewExpenseLoaded(expenses));
      } catch (e) {
        emit(ViewExpenseError('Failed to load expenses: $e'));
      }
    });
  }
}
