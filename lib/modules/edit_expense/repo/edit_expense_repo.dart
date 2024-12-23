import 'package:expense_tracker/data/data_sources/expense_db/expense_db.dart';

class EditExpenseRepository {
  final ExpenseDB _dbHelper = ExpenseDB();

  Future<Map<String, dynamic>> getExpenseById(int expenseId) async {
    return await _dbHelper.getExpenseById(expenseId);
  }

  Future<void> updateExpense(
      int expenseId, Map<String, dynamic> updatedData) async {
    await _dbHelper.updateExpense(expenseId, updatedData);
  }
}
