import 'package:expense_tracker/common_functions/app_colors.dart';
import 'package:expense_tracker/common_functions/title_componenet.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/core/route/route.dart'; // Correct import

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, Routes.homeScreen);
    });

    return const Scaffold(
      backgroundColor: AppColors.bgroundblue,
      body: Center(
          child: TitleCompomnent(
        title: 'EXPENSIFY',
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.appBGWhite,
      )),
    );
  }
}
