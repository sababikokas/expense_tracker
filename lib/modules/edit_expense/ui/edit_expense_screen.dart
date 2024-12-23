import 'package:expense_tracker/common_functions/app_fonts.dart';
import 'package:expense_tracker/common_functions/app_textstyle.dart';
import 'package:expense_tracker/common_functions/home_template.dart';
import 'package:expense_tracker/common_functions/text_box_component.dart';
import 'package:expense_tracker/common_functions/title_componenet.dart';
import 'package:expense_tracker/modules/edit_expense/bloc/edit_expense_bloc.dart';
import 'package:expense_tracker/modules/edit_expense/bloc/edit_expense_event.dart';
import 'package:expense_tracker/modules/edit_expense/bloc/edit_expense_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditExpenseScreen extends StatefulWidget {
  final int expenseId;

  const EditExpenseScreen({super.key, required this.expenseId});

  @override
  // ignore: library_private_types_in_public_api
  _EditExpenseScreenState createState() => _EditExpenseScreenState();
}

class _EditExpenseScreenState extends State<EditExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context
        .read<EditExpenseBloc>()
        .add(LoadExpenseForEditEvent(expenseId: widget.expenseId));
  }

  @override
  Widget build(BuildContext context) {
    return HomeTemplate(
        title: "Edit expense",
        showIcon: false,
        automaticallyImplyLeading: true,
        selectedIndex: 0,
        children: [
          const SizedBox(
            height: 20,
          ),
          BlocConsumer<EditExpenseBloc, EditExpenseState>(
            listener: (context, state) {
              if (state is ExpenseUpdated) {
                Navigator.pop(context, true); // Return true to refresh the list
              }
              if (state is EditExpenseError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              if (state is EditExpenseLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is EditExpenseLoaded) {
                final expense = state.expense;
                _amountController.text = expense['amount'].toString();
                _descriptionController.text = expense['description'];

                return Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextBoxComponent(
                        inputFormatter: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        placeholder: "Add amount",
                        controller: _amountController,
                        label: "Amount",
                        // errorMessage: "kkkk",
                      ),
                      TextBoxComponent(
                        allowLettersOnly: true,
                        placeholder: "Add Description",
                        controller: _descriptionController,
                        label: "Description",
                        // errorMessage: "kkkk",
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
  width: double.maxFinite,
  child: ElevatedButton(
    style: AppFont.elevatedButtonStyle(),
    onPressed: () {
      final amount = double.tryParse(_amountController.text) ?? 0.0;
      final description = _descriptionController.text;

      // Check if there are any changes
      if (amount.toString() == expense['amount'].toString() &&
          description == expense['description']) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: TitleCompomnent(
                title: 'You have not made any changes to save',
                style: AppTextStyles.white14TextMedium),
          ),
        );
        return;
      }

      if (amount <= 0 || description.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: TitleCompomnent(
                title: 'Please fill in all fields correctly',
                style: AppTextStyles.white14TextMedium),
          ),
        );
        return;
      }

      if (_formKey.currentState!.validate()) {
        final updatedData = {
          'amount': amount,
          'description': description,
        };
        context.read<EditExpenseBloc>().add(UpdateExpenseEvent(
              expenseId: widget.expenseId,
              updatedData: updatedData,
            ));
      }
    },
    child: TitleCompomnent(
      title: 'Save Changes',
      style: AppTextStyles.white16TextMedium,
    ),
  ),
),

                      ],
                  ),
                );
              }

              return const Center(child: Text('No expense found'));
            },
          ),
        ]);
  }
}
