import 'package:bloc/bloc.dart';
import 'package:expense_tracker/modules/edit_expense/bloc/edit_expense_event.dart';
import 'package:expense_tracker/modules/edit_expense/bloc/edit_expense_state.dart';
import 'package:expense_tracker/modules/edit_expense/repo/edit_expense_repo.dart';


class EditExpenseBloc extends Bloc<EditExpenseEvent, EditExpenseState> {
  final EditExpenseRepository repository;

  EditExpenseBloc(this.repository) : super(EditExpenseInitial()) {
    on<LoadExpenseForEditEvent>((event, emit) async {
      emit(EditExpenseLoading());
      try {
        final expense = await repository.getExpenseById(event.expenseId);
        emit(EditExpenseLoaded(expense: expense));
      } catch (e) {
        emit(EditExpenseError(message: e.toString()));
      }
    });

    on<UpdateExpenseEvent>((event, emit) async {
      emit(EditExpenseLoading());
      try {
        await repository.updateExpense(event.expenseId, event.updatedData);
        emit(ExpenseUpdated());
      } catch (e) {
        emit(EditExpenseError(message: e.toString()));
      }
    });
  }
}
