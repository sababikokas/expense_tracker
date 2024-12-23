import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// class ExpenseDB {
//   static Future<Database> initDB() async {
//     try {
//       final dbPath = await getDatabasesPath();
//       print('Database path: $dbPath'); // Debug log
//       return openDatabase(
//         join(dbPath, 'expense_tracker.db'),
//         onCreate: (db, version) {
//           print('Creating database...');
//           return db.execute(
//             '''
//             CREATE TABLE expenses(
//               id INTEGER PRIMARY KEY AUTOINCREMENT,
//               amount REAL,
//               date TEXT,
//               description TEXT,
//               category TEXT
//             )
//             ''',
//           );
//         },
//         version: 1,
//       );
//     } catch (e) {
//       print('Database initialization error: $e');
//       throw Exception('Database initialization failed: $e');
//     }
//   }

//   // Fetch a single expense by ID
//   Future<Map<String, dynamic>> getExpenseById(int expenseId) async {
//     final db = await initDB();
//     final result = await db.query(
//       'expenses',
//       where: 'id = ?',
//       whereArgs: [expenseId],
//     );
//     if (result.isNotEmpty) {
//       return result.first; // Return the first matching record
//     } else {
//       throw Exception('Expense not found');
//     }
//   }

//   // Update an expense
//   Future<void> updateExpense(int expenseId, Map<String, dynamic> updatedData) async {
//     final db = await initDB();
//     await db.update(
//       'expenses',
//       updatedData,
//       where: 'id = ?',
//       whereArgs: [expenseId],
//     );
//   }
// }

class ExpenseDB {
  static Future<Database> initDB() async {
    try {
      final dbPath = await getDatabasesPath();
      print('Database path: $dbPath'); // Debug log
      return openDatabase(
        join(dbPath, 'expense_tracker.db'),
        onCreate: (db, version) {
          print('Creating database...');
          return db.execute(
            '''
            CREATE TABLE expenses(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              amount REAL,
              date TEXT,
              description TEXT,
              category TEXT
            )
            ''',
          );
        },
        version: 1,
      );
    } catch (e) {
      print('Database initialization error: $e');
      throw Exception('Database initialization failed: $e');
    }
  }

  // Fetch expenses sorted by date in descending order (latest first)
  Future<List<Map<String, dynamic>>> getExpenses() async {
    final db = await initDB();
    final result = await db.query(
      'expenses',
      orderBy: 'date DESC', // Sort by date in descending order
    );
    return result;
  }

  // Fetch a single expense by ID
  Future<Map<String, dynamic>> getExpenseById(int expenseId) async {
    final db = await initDB();
    final result = await db.query(
      'expenses',
      where: 'id = ?',
      whereArgs: [expenseId],
    );
    if (result.isNotEmpty) {
      return result.first; // Return the first matching record
    } else {
      throw Exception('Expense not found');
    }
  }

  // Update an expense
  Future<void> updateExpense(int expenseId, Map<String, dynamic> updatedData) async {
    final db = await initDB();
    await db.update(
      'expenses',
      updatedData,
      where: 'id = ?',
      whereArgs: [expenseId],
    );
  }
}

