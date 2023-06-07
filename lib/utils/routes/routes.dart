import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_firebase/view/login/login_screen.dart';
import 'package:social_media_firebase/view/splash/splash_screen.dart';
import 'routes_name.dart';
class Routes{

  static Route<dynamic>generateRoute(RouteSettings settings){
    final arguments = settings.arguments;
    switch(settings.name) {
      case RoutesNames.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashSceen());
      case RoutesNames.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(child: Text("No Routes"),),

          );
        });
    }

  }
}