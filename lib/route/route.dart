import 'package:demo_app/ui/home_page/home_screen.dart';
import 'package:demo_app/ui/login_screen/login_screen.dart';
import 'package:demo_app/ui/register_screen/register_screen.dart';
import 'package:demo_app/ui/welcome_screen/welcome_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String loginPage = "/loginPage";
  static const String registerPage = "/registerPage";
  static const String homePage = "/homePage";
  static const String welcomePage = "/";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomePage:
        return MaterialPageRoute(builder: (context) => WelcomeScreen());
      case loginPage:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case registerPage:
        return MaterialPageRoute(builder: (context) => RegisterScreen());
      case homePage:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('title.error'.tr()),
          centerTitle: true,
        ),
        body: Center(
          child: Text('title.pageNotFound'.tr()),
        ),
      );
    });
  }
}
