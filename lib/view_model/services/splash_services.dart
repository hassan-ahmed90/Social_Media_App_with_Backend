
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_firebase/utils/routes/routes_name.dart';
import 'package:social_media_firebase/view_model/services/session_manager.dart';
class SplashServices{

  void isLogin(BuildContext context){

    FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;



    if(user!=null){
      SessionController().uid = user.uid.toString();
      Timer(Duration(seconds: 4), () {
        Navigator.pushNamed(context, RoutesNames.dashBoard);
      });

    }else{
      Timer(Duration(seconds: 4), () {
        Navigator.pushNamed(context, RoutesNames.loginScreen);
      });

    }



  }
}