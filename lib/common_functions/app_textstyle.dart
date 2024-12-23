import 'package:expense_tracker/common_functions/app_strings.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

////SahiBandho style
  static TextStyle get gray16hintTextStyle {
    return const TextStyle(
      fontFamily: AppStrings.inter,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(255, 156, 158, 162),
    );
  }


  static TextStyle get white16TextMedium {
    return const TextStyle(
      fontFamily: AppStrings.inter,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    );
  }
  static TextStyle get white14TextMedium {
    return const TextStyle(
      fontFamily: AppStrings.inter,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    );
  }

  static TextStyle get white20TextMedium {
    return const TextStyle(
      fontFamily: AppStrings.inter,
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    );
  }
   static TextStyle get black16 {
    return const TextStyle(
      fontFamily: AppStrings.inter,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.gray800,
    );
  }
   static TextStyle get black14 {
    return const TextStyle(
      fontFamily: AppStrings.inter,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.gray800,
    );
  }

  static TextStyle get white30TextMedium {
    return const TextStyle(
      fontFamily: AppStrings.inter,
      fontSize: 30,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    );
  }

 

}
