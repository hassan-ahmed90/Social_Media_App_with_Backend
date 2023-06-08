
import 'package:flutter/material.dart';
import 'package:social_media_firebase/view/Dashboard/dashboard%20screen.dart';
import 'package:social_media_firebase/view/forget%20passorf/forget_password.dart';
import 'package:social_media_firebase/view/login/login_screen.dart';
import 'package:social_media_firebase/view/signUp/signup_screen.dart';
import 'package:social_media_firebase/view/splash/splash_screen.dart';
import 'routes_name.dart';
class Routes{

  static Route<dynamic>generateRoute(RouteSettings settings){
  //  final arguments = settings.arguments;
    switch(settings.name) {
      case RoutesNames.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashSceen());
      case RoutesNames.forgetScreen:
        return MaterialPageRoute(builder: (_) => ForgetScreen());
      case RoutesNames.dashBoard:
        return MaterialPageRoute(builder: (_) => DashboardScreen());
      case RoutesNames.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RoutesNames.signupcreen:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(child: Text("No Routes"),),

          );
        });
    }

  }
}