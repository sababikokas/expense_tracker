// import 'package:expense_tracker/apputils/app_assets/app_assets.dart';
// import 'package:expense_tracker/common_functions/app_colors.dart';
// import 'package:expense_tracker/common_functions/app_textstyle.dart';
// import 'package:expense_tracker/common_functions/title_componenet.dart';
// import 'package:expense_tracker/main.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../common_functions/app_fonts.dart';

// class ChangeLanguageBottomSheet extends StatefulWidget {
//   const ChangeLanguageBottomSheet({
//     super.key,
//   });

//   @override
//   State<ChangeLanguageBottomSheet> createState() =>
//       _ChangeLanguageBottomSheetState();
// }

// class _ChangeLanguageBottomSheetState extends State<ChangeLanguageBottomSheet> {
//   String selectedLanguage = 'English';
//   @override
//   void initState() {
//     super.initState();
//     _loadSelectedLanguage();
//   }

//   _loadSelectedLanguage() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       selectedLanguage = prefs.getString('selectedLanguage') ?? 'English';
//       myAppKey.currentState?.setLocale(Locale.fromSubtags(
//           languageCode: selectedLanguage == "English" ? 'en' : "hi"));
//     });
//   }

//   _saveSelectedLanguage() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('selectedLanguage', selectedLanguage);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Wrap(children: [
//       Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//         decoration: const BoxDecoration(
//           color: Color(0xffFAFAFA),
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30),
//             topRight: Radius.circular(30),
//           ),
//         ),
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 15),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   TitleCompomnent(
//                     title: selectedLanguage == 'English'
//                         ? "Change Language"
//                         : "भाषा बदलें",
//                     // AppLocalizations.of(context)!.changelanguage,

//                     // AppLocalizations.of(context)!.changelanguage,
//                     style: AppTextStyles.black16,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: const Icon(
//                       Icons.close,
//                       color: AppColors.darkblueText,
//                       size: 24,
//                     ),
//                   )
//                 ],
//               ),
//               const SizedBox(height: 10),
//               const Divider(),
//               const SizedBox(height: 12),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           selectedLanguage = 'English';
//                         });
//                         print(selectedLanguage);
//                       },
//                       child: Container(
//                         height:
//                             170, // Ensure both containers have the same height
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 5, vertical: 5),
//                         decoration: BoxDecoration(
//                           color: selectedLanguage == 'English'
//                               ? AppColors.bgroundblue
//                               : Colors.white,
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border.all(color: Colors.grey),
//                         ),
//                         child: Column(
//                           children: [
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: selectedLanguage == 'English'
//                                   ? const Icon(
//                                       Icons.radio_button_checked_outlined,
//                                       size: 12,
//                                       color: AppColors.appWhite)
//                                   : Container(
//                                       height: 10,
//                                       width: 10,
//                                       decoration: BoxDecoration(
//                                         border: Border.all(
//                                             color: AppColors.formbordergrey),
//                                         shape: BoxShape.circle,
//                                       ),
//                                     ),
//                             ),
//                             SvgPicture.asset(
//                                 Assets.design), // Replace with your asset path
//                             const SizedBox(height: 15),
//                             Text(
//                               'English',
//                               style: TextStyle(
//                                 color: selectedLanguage == 'English'
//                                     ? Colors.white
//                                     : AppColors.gray800,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             Text(
//                               'English',
//                               style: TextStyle(
//                                 color: selectedLanguage == 'English'
//                                     ? Colors.white
//                                     : AppColors.gray800,
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                       width: 15), // Add spacing between the two containers
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           selectedLanguage = 'hindi';
//                         });
//                         print(selectedLanguage);
//                       },
//                       child: Container(
//                         height:
//                             170, // Ensure both containers have the same height
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 5, vertical: 5),
//                         decoration: BoxDecoration(
//                           color: selectedLanguage != 'English'
//                               ? AppColors.bgroundblue
//                               : Colors.white,
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border.all(color: Colors.grey),
//                         ),
//                         child: Column(
//                           children: [
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: selectedLanguage != 'English'
//                                   ? const Icon(
//                                       Icons.radio_button_checked_outlined,
//                                       size: 12,
//                                       color: AppColors.appWhite)
//                                   : Container(
//                                       height: 10,
//                                       width: 10,
//                                       decoration: BoxDecoration(
//                                         border: Border.all(
//                                             color: AppColors.formbordergrey),
//                                         shape: BoxShape.circle,
//                                       ),
//                                     ),
//                             ),
//                             SvgPicture.asset(
//                                 Assets.design), // Replace with your asset path
//                             const SizedBox(height: 15),
//                             Text(
//                               'हिन्दी',
//                               style: TextStyle(
//                                 color: selectedLanguage != 'English'
//                                     ? Colors.white
//                                     : AppColors.gray800,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             Text(
//                               'हिन्दी',
//                               style: TextStyle(
//                                 color: selectedLanguage != 'English'
//                                     ? Colors.white
//                                     : AppColors.gray800,
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 29,
//               ),
//               SizedBox(
//                 width: double.maxFinite,
//                 child: ElevatedButton(
//                   onPressed: (() {
//                     _saveSelectedLanguage();

//                     // Save selected language and change app language
//                     // FlutterI18n.refresh(context, Locale(selectedLanguage));
//                     setState(() {
//                       myAppKey.currentState?.setLocale(Locale.fromSubtags(
//                           languageCode:
//                               selectedLanguage == "English" ? 'en' : "hi"));
//                     });
//                     Navigator.of(context).pop();
//                     // Close bottom sheet
//                   }),
//                   style: AppFont.elevatedButtonStyle(),
//                   child: Text(
//                     selectedLanguage == 'English' ? "Confirm" : "पुष्टि करें",
//                     style: AppTextStyles.white16TextMedium,
//                   ),
//                   //  color: AppColors.white, borderColor: AppColors.textred),
//                 ),
//               ),
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 20.0, bottom: 20),
//                   child: Container(
//                     height: 1,
//                     width: 50,
//                     color: AppColors.black,
//                   ),
//                 ),
//               ),
//             ]),
//       ),
//     ]);
//   }
// }
import 'package:expense_tracker/apputils/app_assets/app_assets.dart';
import 'package:expense_tracker/common_functions/app_colors.dart';
import 'package:expense_tracker/common_functions/app_textstyle.dart';
import 'package:expense_tracker/common_functions/title_componenet.dart';
import 'package:expense_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../common_functions/app_fonts.dart';
class ChangeLanguageBottomSheet extends StatefulWidget {
  const ChangeLanguageBottomSheet({Key? key}) : super(key: key);

  @override
  State<ChangeLanguageBottomSheet> createState() =>
      _ChangeLanguageBottomSheetState();
}

class _ChangeLanguageBottomSheetState extends State<ChangeLanguageBottomSheet> {
  String selectedLanguage = 'English';

  @override
  void initState() {
    super.initState();
    _loadSelectedLanguage();
  }

  Future<void> _loadSelectedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLanguage = prefs.getString('selectedLanguage') ?? 'English';
    });
  }

  Future<void> _saveSelectedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedLanguage', selectedLanguage);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: const BoxDecoration(
            color: Color(0xffFAFAFA),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleCompomnent(
                    title: selectedLanguage == 'English'
                        ? "Change Language"
                        : "भाषा बदलें",
                    style: AppTextStyles.black16,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      color: AppColors.darkblueText,
                      size: 24,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedLanguage = 'English';
                        });
                      },
                      child: Container(
                        height: 170,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          color: selectedLanguage == 'English'
                              ? AppColors.bgroundblue
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: selectedLanguage == 'English'
                                  ? const Icon(
                                      Icons.radio_button_checked_outlined,
                                      size: 12,
                                      color: AppColors.appWhite)
                                  : Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.formbordergrey),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                            ),
                            SvgPicture.asset(
                                Assets.english), // Replace with your asset path
                            const SizedBox(height: 15),
                            Text(
                              'English',
                              style: TextStyle(
                                color: selectedLanguage == 'English'
                                    ? Colors.white
                                    : AppColors.gray800,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'English',
                              style: TextStyle(
                                color: selectedLanguage == 'English'
                                    ? Colors.white
                                    : AppColors.gray800,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedLanguage = 'हिन्दी';
                        });
                      },
                      child: Container(
                        height: 170,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          color: selectedLanguage == 'हिन्दी'
                              ? AppColors.bgroundblue
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: selectedLanguage == 'हिन्दी'
                                  ? const Icon(
                                      Icons.radio_button_checked_outlined,
                                      size: 12,
                                      color: AppColors.appWhite)
                                  : Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.formbordergrey),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                            ),
                            SvgPicture.asset(
                                Assets.hindi), // Replace with your asset path
                            const SizedBox(height: 15),
                            Text(
                              'हिन्दी',
                              style: TextStyle(
                                color: selectedLanguage == 'हिन्दी'
                                    ? Colors.white
                                    : AppColors.gray800,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'हिन्दी',
                              style: TextStyle(
                                color: selectedLanguage == 'हिन्दी'
                                    ? Colors.white
                                    : AppColors.gray800,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 29),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () async {
                    // Save the selected language and update the app locale
                    await _saveSelectedLanguage();
                    myAppKey.currentState?.setLocale(
                      Locale.fromSubtags(
                        languageCode:
                            selectedLanguage == 'English' ? 'en' : 'hi',
                      ),
                    );
                    Navigator.of(context).pop(); // Close the bottom sheet
                  },
                  style: AppFont.elevatedButtonStyle(),
                  child: Text(
                    selectedLanguage == 'English' ? "Confirm" : "पुष्टि करें",
                    style: AppTextStyles.white16TextMedium,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                  child: Container(
                    height: 1,
                    width: 50,
                    color: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
