import 'package:flutter/material.dart';
import 'package:my_app/screens/home/home_screen.dart';
import 'package:my_app/screens/loading/loading_screen.dart';
import 'package:my_app/screens/login/login_screen.dart';
import 'auth_service_widget.dart';

class AuthLayoutWidget extends StatelessWidget {
  const AuthLayoutWidget({super.key, this.pageIfNotConnected});
  final Widget? pageIfNotConnected;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: authService,
      builder: (BuildContext context, authService, child) {
        return StreamBuilder(
          stream: authService.authStateChanges,
          builder: (context, snapshot) {
            Widget widget;
            if (snapshot.connectionState == ConnectionState.waiting) {
              widget = LoadingScreen();
            }
            else if (snapshot.hasData) {
              widget = HomeScreen();
            } else {
              widget = pageIfNotConnected ?? LoginScreen();
            }
            return widget;
          },
        );
      },
    );
  }
}
