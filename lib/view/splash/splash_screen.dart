import 'package:flutter/material.dart';
import 'package:social_media_firebase/view_model/services/splash_services.dart';

import '../../res/fonts.dart';
class SplashSceen extends StatefulWidget {
  const SplashSceen({Key? key}) : super(key: key);

  @override
  State<SplashSceen> createState() => _SplashSceenState();
}

class _SplashSceenState extends State<SplashSceen> {
  SplashServices sp = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sp.isLogin(context);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/images/logo.jpg')),
              const Padding(
                padding:  EdgeInsets.symmetric(vertical: 20),
                child: Center(child: Text('Tech Brothers Media' ,
                  style: TextStyle(fontFamily: AppFonts.sfProDisplayBold ,
                      fontSize: 40, fontWeight: FontWeight.w700),)),
              )
            ],
          )
      ),
    );
  }
}
