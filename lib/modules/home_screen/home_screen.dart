import 'package:expense_tracker/apputils/app_assets/app_assets.dart';
import 'package:expense_tracker/apputils/app_utils.dart';
import 'package:expense_tracker/common_functions/app_colors.dart';
import 'package:expense_tracker/common_functions/home_template.dart';
import 'package:expense_tracker/common_functions/title_componenet.dart';
import 'package:expense_tracker/core/route/route.dart';
import 'package:expense_tracker/modules/home_screen/change_language/change_language_bottomsheet.dart';
import 'package:expense_tracker/modules/home_screen/drawer/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) async {
        // Pop all routes and close the app
        showExitAlertDialog(context);
        // Return true to allow the back button press
      },
      child: AdvancedDrawer(
        backdropColor: AppColors.dashbordblue,
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        childDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        rtlOpening: true,
        drawer: const MyDrawer(),
        child: HomeTemplate(
            titleFontSize: 14,
            title: '${AppLocalizations.of(context)!.welcome}\nSabab',
            iconWidget: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      showModalBottomSheet<void>(
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return const ChangeLanguageBottomSheet();
                        },
                      );
                    },
                    child: Image.asset(
                      Assets.languagePng,
                      height: 34,
                    )),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    _advancedDrawerController.showDrawer();
                  },
                  child: const Icon(Icons.menu),
                ),
              ],
            ),
            selectedIndex: 0,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.bgroundblue),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleCompomnent(
                            title: AppLocalizations.of(context)!.welcomeMessage,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.appBGWhite,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 0.0),
                          child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(12),
                              ),
                              child: SvgPicture.asset(Assets.design,
                                  color: AppColors.logocolor)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.addExpense);
                },
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.grayBorder),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SvgPicture.asset(Assets.expense),
                        const SizedBox(
                          height: 20,
                        ),
                        TitleCompomnent(
                          title: AppLocalizations.of(context)!.addExpense,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.gray800,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.viewExpense);
                },
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.grayBorder),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          Assets.expense2,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TitleCompomnent(
                          title: AppLocalizations.of(context)!.viewExpense,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.gray800,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.reminderScreen);
                },
                child: Container(
                  width: double.maxFinite,
                  // height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.grayBorder),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          Assets.alarmReminder,
                          height: 150,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TitleCompomnent(
                          title: AppLocalizations.of(context)!.scheduleReminder,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.gray800,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ]),
      ),
    );
  }
}
