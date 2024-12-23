import 'package:expense_tracker/common_functions/app_colors.dart';
import 'package:expense_tracker/apputils/app_utils.dart';
import 'package:expense_tracker/common_functions/title_componenet.dart';
import 'package:expense_tracker/core/route/route.dart';
import 'package:expense_tracker/modules/home_screen/change_language/change_language_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    super.key,
  });

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: Border.all(style: BorderStyle.none),
      clipBehavior: Clip.hardEdge,
      backgroundColor: AppColors.dashbordblue,
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  //SizedBox(height: 40,),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 80, right: 16, bottom: 30),
                    child: Container(
                      height: 100,
                      // width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.appBGWhite),
                      ),
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(width: 10),
                                Expanded(
                                  // Wrap Column with Expanded
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 30,
                                            child: Icon(Icons.person),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 4.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TitleCompomnent(
                                                  maxLines: 4,
                                                  textOverflow:
                                                      TextOverflow.visible,
                                                  title: "Sabab",
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.appBGWhite,
                                                ),
                                               const SizedBox(height: 5,),
                                                TitleCompomnent(
                                                  maxLines: 4,
                                                  textOverflow:
                                                      TextOverflow.visible,
                                                  title:AppLocalizations.of(context)!.personal,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.appBGWhite,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      //  ProfileDetailsScreen()
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.addExpense);
                    },
                    leading: const Icon(
                      Icons.add,
                      color: AppColors.appBGWhite,
                    ),
                    title:  TitleCompomnent(
                      maxLines: 4,
                      textOverflow: TextOverflow.visible,
                      title: AppLocalizations.of(context)!.addExpense,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.appBGWhite,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.appBGWhite,
                      size: 20,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.viewExpense);
                    },
                    leading: const Icon(
                      Icons.view_list_outlined,
                      color: AppColors.appBGWhite,
                    ),
                    title:  TitleCompomnent(
                      maxLines: 4,
                      textOverflow: TextOverflow.visible,
                      title: AppLocalizations.of(context)!.viewExpense,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.appBGWhite,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.appBGWhite,
                      size: 20,
                    ),
                  ),
                  ListTile(
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
                    leading: const Icon(
                      Icons.translate,
                      color: AppColors.appBGWhite,
                    ),
                    title:  TitleCompomnent(
                      maxLines: 4,
                      textOverflow: TextOverflow.visible,
                      title:AppLocalizations.of(context)!.changeLang,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.appBGWhite,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.appBGWhite,
                      size: 20,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      showExitAlertDialog(context);
                    },
                    leading: const Icon(
                      Icons.logout,
                      color: AppColors.appBGWhite,
                    ),
                    title:  TitleCompomnent(
                      maxLines: 4,
                      textOverflow: TextOverflow.visible,
                      title:AppLocalizations.of(context)!.exitApp,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.appBGWhite,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.appBGWhite,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
