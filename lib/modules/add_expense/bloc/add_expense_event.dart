import 'package:equatable/equatable.dart';

abstract class ExpenseEvent extends Equatable {
  const ExpenseEvent();

  @override
  List<Object?> get props => [];
}

class AddExpenseEvent extends ExpenseEvent {
  final double amount;
  final String date;
  final String description;
  final String category;

  const AddExpenseEvent({
    required this.amount,
    required this.date,
    required this.description,
    required this.category,
  });

  @override
  List<Object?> get props => [amount, date, description, category];
}
