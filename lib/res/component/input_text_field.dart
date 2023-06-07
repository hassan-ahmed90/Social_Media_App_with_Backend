import 'package:flutter/material.dart';
import 'package:social_media_firebase/res/colors.dart';
class InputTextField extends StatelessWidget {

  final TextEditingController myController;
  final FocusNode focusNode;
  final FormFieldSetter onFieldSubmitteedValue;
  final FormFieldValidator onValidator;

  final TextInputType keyboradType;
  final String hint;
  final bool obscureText;
  final bool enable ,autoFocus;

   InputTextField({Key? key,
     required this.obscureText,
     required this.onValidator,
     required this.myController,
     required this.focusNode,
     required this.onFieldSubmitteedValue,
     required this.keyboradType,
     required this.hint,
     this.enable = true,
     this.autoFocus=false,

   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: myController,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitteedValue,
        validator: onValidator,
        keyboardType: keyboradType,
        obscureText: obscureText,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(height:0,fontSize: 19),
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: EdgeInsets.all(15),
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(height:0,color: AppColors.primaryTextTextColor.withOpacity(0.8)),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textFieldDefaultFocus),
                borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.secondaryColor ),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.alertColor),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textFieldDefaultBorderColor),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),


      ),
    );
  }
}
