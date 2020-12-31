import 'package:flutter/material.dart';

import 'app/app_local_store.dart';
import 'pages/home/home_view.dart';
import 'pages/login/login_view.dart';
import 'pages/startup/startup_view.dart';
import 'pages/drawer/settings_view.dart';
import 'pages/drawer/about_view.dart';
import 'pages/drawer/help_view.dart';
import 'pages/drawer/profile_view.dart';
import 'pages/drawer/privacy_policy_view.dart';
import 'pages/drawer/terms_of_service_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppLocalStore.instance.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Market',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: 'Corben',
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),
      initialRoute: StartupView.routeName,
      routes: {
        StartupView.routeName: (context) => StartupView(),
        LoginView.routeName: (context) => LoginView(),
        HomeView.routeName: (context) => HomeView(),
        ProfileView.routeName: (context) => ProfileView(),
        SettingsView.routeName: (context) => SettingsView(),
        TermsOfServiceView.routeName: (context) => TermsOfServiceView(),
        PrivacyPolicyView.routeName: (context) => PrivacyPolicyView(),
        HelpView.routeName: (context) => HelpView(),
        AboutView.routeName: (context) => AboutView(),
      },
    );
  }
}
