import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wtg_admin/screens/routes/app_routes.dart';
import 'package:wtg_admin/screens/splash.dart';

import 'core/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      title: 'WTG Admin Panel',
      home: Splash(),
      routes: AppRoutes.routes,
    );
  }
}
