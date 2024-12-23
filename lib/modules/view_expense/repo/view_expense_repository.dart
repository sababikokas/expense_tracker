// lib/data/repositories/expense_repository/expense_repository.dart

import 'package:sqflite/sqflite.dart';
import 'package:expense_tracker/data/data_sources/expense_db/expense_db.dart';

class ViewExpenseRepository {
  // Fetch expenses from the database
  Future<List<Map<String, dynamic>>> getExpenses() async {
    final db = await ExpenseDB.initDB();
    return await db.query('expenses'); // Fetch all expenses
  }

  // Add expense method remains the same as before
  Future<void> addExpense({
    required double amount,
    required String date,
    required String description,
    required String category,
  }) async {
    final db = await ExpenseDB.initDB();
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
  }
}
