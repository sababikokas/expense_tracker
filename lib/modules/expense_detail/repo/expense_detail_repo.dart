import 'package:expense_tracker/data/data_sources/expense_db/expense_db.dart';

class ExpenseDetailRepository {
  Future<Map<String, dynamic>> getExpense(int expenseId) async {
    final db = await ExpenseDB.initDB();
    final result = await db.query(
      'expenses',
      where: 'id = ?',
      whereArgs: [expenseId],
    );
    if (result.isEmpty) {
      throw Exception('Expense not found');
    }
    return result.first;
  }

  Future<void> deleteExpense(int expenseId) async {
    final db = await ExpenseDB.initDB();
    await db.delete(
      'expenses',
      where: 'id = ?',
      whereArgs: [expenseId],
    );
  }
}
