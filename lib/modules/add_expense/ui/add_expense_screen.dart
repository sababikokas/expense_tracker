import 'package:expense_tracker/common_functions/app_fonts.dart';
import 'package:expense_tracker/common_functions/app_textstyle.dart';
import 'package:expense_tracker/common_functions/home_template.dart';
import 'package:expense_tracker/common_functions/text_box_component.dart';
import 'package:expense_tracker/common_functions/title_componenet.dart';
import 'package:expense_tracker/core/route/route.dart';
import 'package:expense_tracker/modules/add_expense/bloc/add_expense_event.dart';
import 'package:expense_tracker/modules/add_expense/bloc/add_expense_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expense_tracker/modules/add_expense/bloc/add_expense_bloc.dart';
import 'package:expense_tracker/data/repositories/expense_repository/expense_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final TextEditingController _amountController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return HomeTemplate(
        title: 
        AppLocalizations.of(context)!.addExpense,
        automaticallyImplyLeading: true,
        showIcon: false,
        selectedIndex: 0,
        children: [
          BlocProvider(
            create: (_) => ExpenseBloc(ExpenseRepository()),
            child: BlocConsumer<ExpenseBloc, ExpenseState>(
              listener: (context, state) {
                if (state is ExpenseAdded) {
                  Navigator.pushReplacementNamed(
                      context, Routes.viewExpense); // Correct navigation
                  // Navigator.pop(context); // Go back after adding the expense
                } else if (state is ExpenseError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) {
                if (state is ExpenseLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextBoxComponent(
                      inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                      placeholder:AppLocalizations.of(context)!.addAmount,
                      controller: _amountController,
                      label:AppLocalizations.of(context)!.amount,
                    ),
                    TextBoxComponent(
                      allowLettersOnly: true,
                      placeholder:AppLocalizations.of(context)!.addDescription,
                      controller: _descriptionController,
                      label:AppLocalizations.of(context)!.description,
                    ),
                    TextBoxComponent(
                      allowLettersOnly: true,
                      placeholder: AppLocalizations.of(context)!.addCategory,
                      controller: _categoryController,
                      label:AppLocalizations.of(context)!.category,
                    ),
                   const SizedBox(height: 50,),
                   
                    SizedBox(
                      //  height: 200,
                      width: double.maxFinite,
                      child: ElevatedButton(
                        style: AppFont.elevatedButtonStyle(),
                        onPressed: () {
                          final amount =
                              double.tryParse(_amountController.text) ?? 0.0;
                          final description = _descriptionController.text;
                          final category = _categoryController.text;

                          if (amount <= 0 ||
                              description.isEmpty ||
                              category.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: TitleCompomnent(
                                    title:
                                        'Please fill in all fields correctly',
                                    style: AppTextStyles.white14TextMedium),
                              ),
                            );
                            return;
                          }
                          context.read<ExpenseBloc>().add(AddExpenseEvent(
                                amount: amount,
                                date: DateTime.now().toIso8601String(),
                                description: description,
                                category: category,
                              ));
                        },
                        child: TitleCompomnent(
                          title: AppLocalizations.of(context)!.saveExpense,
                          style: AppTextStyles.white16TextMedium,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ]);
  }
}
