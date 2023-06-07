import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_media_firebase/res/colors.dart';
import 'package:social_media_firebase/res/fonts.dart';
import 'package:social_media_firebase/utils/routes/routes.dart';
import 'package:social_media_firebase/utils/routes/routes_name.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: AppColors.primaryMaterialColor,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: AppColors.whiteColor,
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 22,fontFamily: AppFonts.sfProDisplayMedium,color: AppColors.primaryTextTextColor)
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 40,fontFamily: AppFonts.sfProDisplayMedium,color: AppColors.primaryTextTextColor,fontWeight: FontWeight.w500,height: 1.6),
            displayMedium: TextStyle(fontSize: 32,fontFamily: AppFonts.sfProDisplayMedium,color: AppColors.primaryTextTextColor,fontWeight: FontWeight.w500,height: 1.6),
            displaySmall: TextStyle(fontSize: 28,fontFamily: AppFonts.sfProDisplayMedium,color: AppColors.primaryTextTextColor,fontWeight: FontWeight.w500,height: 1.6),
          headlineMedium: TextStyle(fontSize: 24,fontFamily: AppFonts.sfProDisplayMedium,color: AppColors.primaryTextTextColor,fontWeight: FontWeight.w500,height: 1.6),
        headlineSmall: TextStyle(fontSize: 20,fontFamily: AppFonts.sfProDisplayMedium,color: AppColors.primaryTextTextColor,fontWeight: FontWeight.w500,height: 1.6),
    titleLarge: TextStyle(fontSize: 17,fontFamily: AppFonts.sfProDisplayBold,color: AppColors.primaryTextTextColor,fontWeight: FontWeight.w700,height: 1.6),
            bodyLarge: TextStyle(fontSize: 17,fontFamily: AppFonts.sfProDisplayMedium,color: AppColors.primaryTextTextColor,fontWeight: FontWeight.w700,height: 1.6),
            bodyMedium: TextStyle(fontSize: 14,fontFamily: AppFonts.sfProDisplayRegular,color: AppColors.primaryTextTextColor,height: 1.6),
            bodySmall: TextStyle(fontSize: 12,fontFamily: AppFonts.sfProDisplayBold,color: AppColors.primaryTextTextColor,height: 1.6)
        ),
      ),
      initialRoute: RoutesNames.splashScreen,
onGenerateRoute: Routes.generateRoute,
    );
  }
}
