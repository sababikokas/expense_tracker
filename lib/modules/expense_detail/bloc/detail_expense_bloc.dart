import 'package:bloc/bloc.dart';
import 'package:expense_tracker/modules/expense_detail/bloc/expense_detail_event.dart';
import 'package:expense_tracker/modules/expense_detail/bloc/expense_detail_state.dart';
import 'package:expense_tracker/modules/expense_detail/repo/expense_detail_repo.dart';

class ExpenseDetailBloc extends Bloc<ExpenseDetailEvent, ExpenseDetailState> {
  final ExpenseDetailRepository _repository;

  ExpenseDetailBloc(this._repository) : super(ExpenseInitial()) {
    on<LoadExpenseEvent>((event, emit) async {
      emit(ExpenseLoading());
      try {
        final expense = await _repository.getExpense(event.expenseId);
        emit(ExpenseLoaded(expense));
      } catch (e) {
        emit(ExpenseError('Failed to load expense: $e'));
      }
    });

    on<DeleteExpenseEvent>((event, emit) async {
      try {
        await _repository.deleteExpense(event.expenseId);
        emit(ExpenseDeleted());
      } catch (e) {
        emit(ExpenseError('Failed to delete expense: $e'));
      }
    });
  }
}
