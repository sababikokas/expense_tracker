import 'package:expense_tracker/core/theme.dart';
import 'package:expense_tracker/notification_service/notification_services.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/core/route/route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// ignore: library_private_types_in_public_api
final GlobalKey<_MyAppState> myAppKey = GlobalKey<_MyAppState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final notificationService = NotificationService();
  await notificationService.init(); // Initialize notifications before runApp
  runApp(MyApp(key: myAppKey));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  @override
  void initState() {
    super.initState();
    _loadSavedLocale();
  }

  Future<void> _loadSavedLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? language = prefs.getString('selectedLanguage') ?? 'English';
    setState(() {
      _locale = Locale(language == 'English' ? 'en' : 'hi');
    });
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
    _saveLocale(locale.languageCode);
  }

  Future<void> _saveLocale(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'selectedLanguage', languageCode == 'en' ? 'English' : 'हिन्दी');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Expense Tracker',
      theme: AppTheme.lightTheme,
      initialRoute: Routes.splash,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}


