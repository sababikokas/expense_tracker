// import 'package:expense_tracker/main.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class changelanguage extends StatefulWidget {
//   final String? from;

//   const changelanguage({super.key, this.from});
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<changelanguage> {
//   String selectedLanguage = 'English';
//   @override
//   void initState() {
//     super.initState();
//     _loadSelectedLanguage();
//   }

//   // _loadSelectedLanguage() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   setState(() {
//   //     selectedLanguage = prefs.getString('selectedLanguage') ?? 'English';
//   //   });
//   // }
//   _loadSelectedLanguage() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       selectedLanguage = prefs.getString('selectedLanguage') ?? 'English';
//       MyApp.of(context)?.setLocale(Locale.fromSubtags(
//           languageCode: selectedLanguage == "English" ? 'en' : "hi"));
//     });
//   }

//   _saveSelectedLanguage() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('selectedLanguage', selectedLanguage);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: AppColors.white,
//         automaticallyImplyLeading: false,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 0,
//             ),
//             Center(
//               child: SvgPicture.asset(
//                 "assets/images/language translation (1).svg",
//                 width: 100,
//                 height: 100,
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             TitleCompomnent(
//               title: selectedLanguage == "English"
//                   ? "Select Language"
//                   : "भाषा चुनें",
//               //AppLocalizations.of(context)!.selectlang,
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             TitleCompomnent(
//               textAlign: TextAlign.center,
//               title: selectedLanguage == "English"
//                   ? "Your app in your own language now!"
//                   : "ऐप के लिए अपनी पसंदीदा भाषा चुनें। आप इसे बाद में खाता सेटिंग में समायोजित कर सकते हैं.",
//               fontSize: 16,
//               fontWeight: FontWeight.w400,
//               color: AppColors.gray600,
//             ),
//             const SizedBox(
//               height: 60,
//             ),
//             Column(
//               children: [
//                 languageOption('English'),
//                 Divider(),
//                 languageOption('हिन्दी'),
//                 Divider(),
//                 // Add more language options here if needed
//               ],
//             ),
//             Spacer(),
//             SizedBox(
//               width: double.maxFinite,
//               child: ElevatedButton(
//                 onPressed: () {
//                   _saveSelectedLanguage();
//                   // Save selected language and change app language
//                   // FlutterI18n.refresh(context, Locale(selectedLanguage));
//                   setState(() {
//                     MyApp.of(context)?.setLocale(Locale.fromSubtags(
//                         languageCode:
//                             selectedLanguage == "English" ? 'en' : "hi"));
//                   });
//                   // Navigate to the next screen
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => widget.from == "MENU"
//                             ? DashboardScreen()
//                             : OnboardingLoginscreen()
//                         // LocationAccesScreen(),
//                         ),
//                   );
//                 },
//                 child: Text(
//                   selectedLanguage == "English" ? "Submit" : "पुष्टि करें",
//                   //AppLocalizations.of(context)!.submit,
//                   style: AppTextStyles.white14TextMedium,
//                 ),
//                 style: AppFont.elevatedButtonStyle(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget languageOption(String language) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedLanguage = language;
//           // MyApp.of(context)?.setLocale(Locale.fromSubtags(
//           //     languageCode: selectedLanguage == "English" ? 'en' : "hi"));
//         });
//       },
//       child: Container(
//         color: Colors
//             .transparent, // Ensure the container takes full width and height
//         // padding: const EdgeInsets.symmetric(vertical: 8.0),
//         child: Row(
//           children: [
//             SvgPicture.asset(
//               language == 'English'
//                   ? 'assets/images/english.svg'
//                   : 'assets/images/hindi.svg',
//               width: 60,
//               height: 60,
//             ),
//             SizedBox(width: 10),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   language,
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 TitleCompomnent(
//                   title: language,
//                   fontSize: 12,
//                   fontWeight: FontWeight.w400,
//                   color: AppColors.gray600,
//                 )
//               ],
//             ),
//             Spacer(),
//             Radio(
//               value: language,
//               groupValue: selectedLanguage,
//               onChanged: (value) {
//                 setState(() {
//                   selectedLanguage = value.toString();
//                   MyApp.of(context)?.setLocale(Locale.fromSubtags(
//                       languageCode:
//                           selectedLanguage == "English" ? 'en' : "hi"));
//                 });
//               },
//               activeColor: AppColors.skyBluebutton,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Widget languageOption(String language) {
//   //   return GestureDetector(
//   //     onTap: () {
//   //       setState(() {
//   //         MyApp.of(context)?.setLocale(Locale.fromSubtags(
//   //             languageCode: selectedLanguage == "English" ? 'en' : "hi"));
//   //       });
//   //     },
//   //     child: Container(
//   //       color: AppColors.appBlue,
//   //       child: Row(
//   //         children: [
//   //           SvgPicture.asset(
//   //             language == 'English'
//   //                 ? 'assets/images/english.svg'
//   //                 : 'assets/images/hindi.svg',
//   //             width: 60,
//   //             height: 60,
//   //           ),
//   //           SizedBox(width: 10),
//   //           GestureDetector(
//   //             onTap: () {
//   //               setState(() {
//   //                 selectedLanguage = language;
//   //               });
//   //             },
//   //             child: Column(
//   //               crossAxisAlignment: CrossAxisAlignment.start,
//   //               children: [
//   //                 Text(
//   //                   language,
//   //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//   //                 ),
//   //                 TitleCompomnent(
//   //                   title: language,
//   //                   fontSize: 12,
//   //                   fontWeight: FontWeight.w400,
//   //                   color: AppColors.gray600,
//   //                 )
//   //               ],
//   //             ),
//   //           ),
//   //           Spacer(),
//   //           Radio(
//   //             value: language,
//   //             groupValue: selectedLanguage,
//   //             onChanged: (value) {
//   //               setState(() {
//   //                 selectedLanguage = value.toString();
//   //               });
//   //               setState(() {
//   //                 MyApp.of(context)?.setLocale(Locale.fromSubtags(
//   //                     languageCode:
//   //                         selectedLanguage == "English" ? 'en' : "hi"));
//   //               });
//   //             },
//   //             activeColor: AppColors.skyBluebutton,
//   //           ),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }
// }
