import 'package:sqflite/sqflite.dart';
import 'package:expense_tracker/data/data_sources/expense_db/expense_db.dart';

class ExpenseRepository {
  Future<void> addExpense({
    required double amount,
    required String date,
    required String description,
    required String category,
  }) async {
    try {
      final db = await ExpenseDB.initDB();
      print('Database opened successfully'); // Debug log
      await db.insert(
        'expenses',
        {
          'amount': amount,
          'date': date,
          'description': description,
          'category': category,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      print('Expense inserted into database'); // Debug log
    } catch (e) {
      print('Error inserting expense: $e'); // Debug log
      throw Exception('Failed to add expense: $e');
    }
  }
}
