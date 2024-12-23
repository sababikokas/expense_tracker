import 'package:bloc/bloc.dart';
import 'package:expense_tracker/data/repositories/expense_repository/expense_repository.dart';
import 'package:expense_tracker/modules/add_expense/bloc/add_expense_event.dart';
import 'package:expense_tracker/modules/add_expense/bloc/add_expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final ExpenseRepository _repository;

  ExpenseBloc(this._repository) : super(ExpenseInitial()) {
    on<AddExpenseEvent>((event, emit) async {
      emit(ExpenseLoading());
      try {
        print('Adding expense: ${event.description}'); // Debug log
        await _repository.addExpense(
          amount: event.amount,
          date: event.date,
          description: event.description,
          category: event.category,
        );
        emit(ExpenseAdded());
        print('Expense added successfully'); // Debug log
      } catch (e) {
        print('Error in adding expense: $e'); // Debug log
        emit(ExpenseError('Failed to add expense: ${e.toString()}'));
      }
    });
  }
}
