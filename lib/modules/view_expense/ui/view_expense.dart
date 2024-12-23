import 'package:expense_tracker/apputils/app_assets/app_assets.dart';
import 'package:expense_tracker/common_functions/app_colors.dart';
import 'package:expense_tracker/common_functions/app_textstyle.dart';
import 'package:expense_tracker/common_functions/home_template.dart';
import 'package:expense_tracker/common_functions/title_componenet.dart';
import 'package:expense_tracker/core/route/route.dart';
import 'package:expense_tracker/modules/view_expense/bloc/view_expnse_event.dart';
import 'package:expense_tracker/modules/view_expense/repo/view_expense_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expense_tracker/modules/view_expense/bloc/view_expense_bloc.dart';
import 'package:expense_tracker/modules/view_expense/bloc/view_expense_state.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ViewExpenseScreen extends StatelessWidget {
  const ViewExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ViewExpenseBloc>(
        create: (_) =>
            ViewExpenseBloc(ViewExpenseRepository())..add(LoadExpensesEvent()),
        child: HomeTemplate(
            title: AppLocalizations.of(context)!.allExpense,
            showIcon: false,
            automaticallyImplyLeading: true,
            selectedIndex: 0,
            children: [
              BlocConsumer<ViewExpenseBloc, ViewExpenseState>(
                listener: (context, state) {
                  if (state is ViewExpenseError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is ViewExpenseLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is ViewExpenseLoaded) {
                    final expenses = state.expenses;
                    if (expenses.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 250.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(Assets.emptyExpense),
                            const SizedBox(
                              height: 50,
                            ),
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, Routes.addExpense);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.bgroundblue,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 48,
                                  width: 258,
                                  child: Center(
                                    child: TitleCompomnent(
                                      title:AppLocalizations.of(context)!.firstExpense,
                                      style: AppTextStyles.white16TextMedium,
                                    ),
                                  ),
                                ),
                              ),
                            )),
                          ],
                        ),
                      );
                    }

                    List<Map<String, dynamic>> sortedExpenses =
                        List.from(expenses);
                    sortedExpenses.sort((a, b) {
                      final dateA = DateTime.parse(a['date']);
                      final dateB = DateTime.parse(b['date']);
                      return dateB
                          .compareTo(dateA); // Sort by date (descending)
                    });

                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        primary: true,
                        itemCount: sortedExpenses.length,
                        itemBuilder: (context, index) {
                          final expense = sortedExpenses[index];
                          return ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            title: TitleCompomnent(
                              title: '₹${expense['amount']}',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.gray800,
                            ),
                            subtitle: TitleCompomnent(
                              title:
                                  '${AppLocalizations.of(context)!.category}: ${expense['category']}',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.gray800,
                            ),
                            trailing: TitleCompomnent(
                              title: DateFormat('dd MMM yy').format(
                                DateTime.parse(expense['date']),
                              ),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.gray800,
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Routes.expenseDetail,
                                arguments: {
                                  'expenseId': expense['id'],
                                  'viewExpenseBloc':
                                      context.read<ViewExpenseBloc>(),
                                },
                              );
                            },
                          );
                        },
                      ),
                    );
                  }

                  return Center(
                      child: TitleCompomnent(
                          title: 'Something went wrong.',
                          style: AppTextStyles.black16));
                },
              ),
            ]));
  }
}
