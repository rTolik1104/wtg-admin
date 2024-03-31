import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wtg_admin/core/env/config.dart';
import 'package:wtg_admin/screens/routes/app_routes.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin, RouteAware {
  @override
  void initState() {
    Config.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      Future.delayed(const Duration(seconds: 2), (){
        Navigator.pushNamed(context, AppRoutes.auth);
      });
      return WillPopScope(
        onWillPop: () async => false,
        child: const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
        ),
      );
  }
}
