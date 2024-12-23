import 'package:expense_tracker/data/repositories/expense_repository/expense_repository.dart';
import 'package:expense_tracker/modules/add_expense/bloc/add_expense_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BlocProviders extends StatelessWidget {
  final Widget child;

  const BlocProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ExpenseBloc>(
          create: (_) => ExpenseBloc(ExpenseRepository()),
        ),
      ],
      child: child,
    );
  }
}
