// lib/routes.dart
import 'package:expense_tracker/modules/edit_expense/bloc/edit_expense_bloc.dart';
import 'package:expense_tracker/modules/edit_expense/repo/edit_expense_repo.dart';
import 'package:expense_tracker/modules/edit_expense/ui/edit_expense_screen.dart';
import 'package:expense_tracker/modules/expense_detail/bloc/detail_expense_bloc.dart';
import 'package:expense_tracker/modules/expense_detail/repo/expense_detail_repo.dart';
import 'package:expense_tracker/modules/expense_detail/ui/expense_detail.dart';
import 'package:expense_tracker/modules/home_screen/home_screen.dart';
import 'package:expense_tracker/modules/reminder_screen/reminder_screen.dart';
import 'package:expense_tracker/modules/view_expense/bloc/view_expense_bloc.dart'; // Import ViewExpenseBloc
import 'package:expense_tracker/modules/view_expense/repo/view_expense_repository.dart';
import 'package:expense_tracker/modules/view_expense/ui/view_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/modules/add_expense/ui/add_expense_screen.dart';
import 'package:expense_tracker/modules/splash_screen/splash_screen.dart';
import 'package:expense_tracker/data/repositories/expense_repository/expense_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const String splash = '/';
  static const String addExpense = '/addExpense';
  static const String viewExpense = '/view-expense';
  static const String expenseDetail = '/expense-detail';
  static const String editExpense = '/edit-expense';
  static const String homeScreen = '/home-screen';
  static const String reminderScreen = '/reminder-screen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case addExpense:
        return MaterialPageRoute(builder: (_) => AddExpenseScreen());
      case viewExpense:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<ViewExpenseBloc>(
            create: (_) => ViewExpenseBloc(ViewExpenseRepository()),
            child: const ViewExpenseScreen(),
          ),
        );
      case expenseDetail:
        final args = settings.arguments as Map<String, dynamic>;
        final expenseId = args['expenseId'] as int;
        final viewExpenseBloc = args['viewExpenseBloc'] as ViewExpenseBloc;

        return MaterialPageRoute(
          builder: (_) => BlocProvider<ExpenseDetailBloc>(
            create: (_) => ExpenseDetailBloc(ExpenseDetailRepository()),
            child: ExpenseDetailScreen(
              expenseId: expenseId,
              viewExpenseBloc: viewExpenseBloc, // Pass the ViewExpenseBloc here
            ),
          ),
        );
      case Routes.editExpense:
        final expenseId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => EditExpenseBloc(EditExpenseRepository()),
            child: EditExpenseScreen(expenseId: expenseId),
          ),
        );
      case Routes.reminderScreen:
        return MaterialPageRoute(builder: (_) => const ReminderScreen());

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
