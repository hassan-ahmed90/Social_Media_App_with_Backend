import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_media_firebase/res/colors.dart';

class Utils{
  static void fieldFocus(BuildContext context, FocusNode currenFocus, FocusNode nextFocus){
    currenFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
  static toasMessege(String messege){
    Fluttertoast.showToast(msg: messege,
    backgroundColor: AppColors.primaryTextTextColor,
    textColor: AppColors.whiteColor,
    fontSize: 16,
    );
  }
}