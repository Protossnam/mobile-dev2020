import 'package:flutter/material.dart';
import 'pages/dashboard/dashboard_view.dart';
import 'pages/drawer/widgets/user_info_view.dart';
import 'pages/drawer/profile_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: DashboardView());
  }
}
