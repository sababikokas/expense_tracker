import 'package:expense_tracker/common_functions/app_colors.dart';
import 'package:expense_tracker/common_functions/app_fonts.dart';
import 'package:expense_tracker/common_functions/app_textstyle.dart';
import 'package:expense_tracker/common_functions/home_template.dart';
import 'package:expense_tracker/common_functions/title_componenet.dart';
import 'package:expense_tracker/modules/expense_detail/bloc/detail_expense_bloc.dart';
import 'package:expense_tracker/modules/expense_detail/bloc/expense_detail_event.dart';
import 'package:expense_tracker/modules/expense_detail/bloc/expense_detail_state.dart';
import 'package:expense_tracker/modules/view_expense/bloc/view_expnse_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expense_tracker/modules/view_expense/bloc/view_expense_bloc.dart'; // Import ViewExpenseBloc
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExpenseDetailScreen extends StatefulWidget {
  final int expenseId;
  final ViewExpenseBloc viewExpenseBloc;

  const ExpenseDetailScreen({
    super.key,
    required this.expenseId,
    required this.viewExpenseBloc,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ExpenseDetailScreenState createState() => _ExpenseDetailScreenState();
}

class _ExpenseDetailScreenState extends State<ExpenseDetailScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<ExpenseDetailBloc>()
        .add(LoadExpenseEvent(expenseId: widget.expenseId));
  }

  @override
  Widget build(BuildContext context) {
    return HomeTemplate(
        title: AppLocalizations.of(context)!.viewExpense,
        showIcon: false,
        automaticallyImplyLeading: true,
        selectedIndex: 0,
        children: [
          const SizedBox(
            height: 20,
          ),
          BlocConsumer<ExpenseDetailBloc, ExpenseDetailState>(
            listener: (context, state) {
              if (state is ExpenseDeleted) {
                widget.viewExpenseBloc.add(LoadExpensesEvent());
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              if (state is ExpenseLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is ExpenseLoaded) {
                final expense = state.expense;
                return Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.grayBorder),
                      ),
                      // elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleCompomnent(
                              title:
                                  '${AppLocalizations.of(context)!.amount}: ${expense['amount']}',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.gray800,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TitleCompomnent(
                              title: DateFormat('dd MMM yy').format(
                                DateTime.parse(expense['date']),
                              ),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.gray800,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TitleCompomnent(
                              title:
                                  '${AppLocalizations.of(context)!.description}: ${expense['description']}',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.gray800,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TitleCompomnent(
                              title:
                                  '${AppLocalizations.of(context)!.category}: ${expense['category']}',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.gray800,
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        style: AppFont.elevatedButtonStyle(),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/edit-expense',
                            arguments: expense['id'],
                          ).then((_) {
                            widget.viewExpenseBloc.add(LoadExpensesEvent());
                            // ignore: use_build_context_synchronously
                            context.read<ExpenseDetailBloc>().add(
                                  LoadExpenseEvent(expenseId: widget.expenseId),
                                );
                          });
                        },
                        child: TitleCompomnent(
                          title: AppLocalizations.of(context)!.edit,
                          style: AppTextStyles.white16TextMedium,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        style: AppFont.elevatedButtonStyle(),
                        onPressed: () {
                          context.read<ExpenseDetailBloc>().add(
                              DeleteExpenseEvent(expenseId: expense['id']));
                        },
                        child: TitleCompomnent(
                          title: AppLocalizations.of(context)!.delete,
                          style: AppTextStyles.white16TextMedium,
                        ),
                      ),
                    ),
                  ],
                );
              }

              return const Center(child: Text('No expense found'));
            },
          ),
        ]);
  }
}
