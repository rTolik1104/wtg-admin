import 'dart:js';

import 'package:flutter/material.dart';
import 'package:wtg_admin/screens/auth/auth_screen.dart';
import 'package:wtg_admin/screens/main_screen.dart';
import 'package:wtg_admin/screens/splash.dart';

class AppRoutes {
  static const String auth = '/auth';
  static const String splash = '/splash';
  static const String mainScreen = '/main';

  static final Map<String, WidgetBuilder> routes = {
    auth: (context) => AuthScreen(),
    splash: (context) => Splash(),
    mainScreen: (context) => MainScreen()
  };
}