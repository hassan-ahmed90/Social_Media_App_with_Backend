import 'package:flutter/material.dart';
import 'package:social_media_firebase/res/colors.dart';
class RoundButton extends StatelessWidget {
  final String title;
 final  bool loading;
  final VoidCallback onpressed;
  final Color color,textColor;
   RoundButton({Key? key,required this.title,
     required this.onpressed,
     this.color= AppColors.primaryColor,
     this.textColor = AppColors.whiteColor,
     this.loading=false,

   }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(child: loading ?CircularProgressIndicator(color: Colors.white,):Text(title,style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 15,color: textColor),),),
      ),

    );
  }
}
