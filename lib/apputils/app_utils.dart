import 'dart:developer';
import 'package:expense_tracker/common_functions/app_colors.dart';
import 'package:expense_tracker/common_functions/app_fonts.dart';
import 'package:expense_tracker/common_functions/title_componenet.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:device_info_plus/device_info_plus.dart';

class AppUtils {
  AppUtils._();

  static double deviceHeight = 0.0;
  static double deviceWidth = 0.0;

  static debugPrint(dynamic printText) {
    if (kDebugMode) log(printText?.toString() ?? '');
  }

  //// string capitalization
  String capitalizeFirstLetter(String word) {
    if (word.isEmpty) return '';
    return word[0].toUpperCase() + word.substring(1);
  }
}

///exit app
void showExitAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.white,
        title:  TitleCompomnent(
          title: AppLocalizations.of(context)!.exitAppDesc,
          fontSize: 14,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              // Dismiss the dialog
              Navigator.of(context).pop();
            },
            style: AppFont.elevatedButtonStyle(),
            child:  TitleCompomnent(
              title:AppLocalizations.of(context)!.no,
              color: AppColors.appBGWhite,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              
              SystemNavigator.pop();
              Navigator.of(context).pop(); // Exit the app
            },
            style: AppFont.elevatedButtonStyle(),
            child:  TitleCompomnent(
              title: AppLocalizations.of(context)!.yes,
              color: AppColors.appBGWhite,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      );
    },
  );
}
