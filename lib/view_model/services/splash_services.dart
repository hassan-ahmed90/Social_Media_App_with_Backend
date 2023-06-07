
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:social_media_firebase/utils/routes/routes_name.dart';
class SplashServices{

  void isLogin(BuildContext context){

    Timer(Duration(seconds: 4), () {
      Navigator.pushNamed(context, RoutesNames.loginScreen);
    });

  }
}