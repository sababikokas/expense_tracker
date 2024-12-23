import 'package:equatable/equatable.dart';

abstract class EditExpenseEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadExpenseForEditEvent extends EditExpenseEvent {
  final int expenseId;

  LoadExpenseForEditEvent({required this.expenseId});

  @override
  List<Object?> get props => [expenseId];
}

class UpdateExpenseEvent extends EditExpenseEvent {
  final int expenseId;
  final Map<String, dynamic> updatedData;

  UpdateExpenseEvent({required this.expenseId, required this.updatedData});

  @override
  List<Object?> get props => [expenseId, updatedData];
}
