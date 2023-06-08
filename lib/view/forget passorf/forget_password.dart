

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_firebase/res/component/input_text_field.dart';
import 'package:social_media_firebase/res/component/round_button.dart';

import 'package:social_media_firebase/view/forget%20passorf/forgot_controller.dart';


class ForgetScreen extends StatefulWidget {
  const ForgetScreen({Key? key}) : super(key: key);

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final bool loading =false;
  final emailController  = TextEditingController();
  final emailFocus= FocusNode();

  final _formkey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.of(context).size.height*1;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(height: height*.09,),
                Text("Forget Password",style: Theme.of(context).textTheme.displaySmall,),
                SizedBox(height: height*.01,),

                Text("Enter your email \n to recover your Password",style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,),
                SizedBox(height: height*.01,),

                Form(
                    key: _formkey,
                    child: Padding(
                      padding: EdgeInsets.only(top: height*.06,bottom: height*0.01),
                      child: Column(
                        children: [
                          InputTextField(
                              obscureText: false,
                              onValidator: (value){
                                return value.isEmpty ? "Enter email" :null;
                              },
                              myController: emailController,
                              focusNode: emailFocus,
                              onFieldSubmitteedValue: (value){},
                              keyboradType: TextInputType.emailAddress,
                              hint: "Email"),
                          SizedBox(height: height*.01,),
                        ],
                      ),
                    )),
                SizedBox(height: height*.03,),
                //SizedBox(height: 70,),
                ChangeNotifierProvider(create: (_)=>ForgotController(),
                  child: Consumer<ForgotController>(
                    builder: (context,provider,child){
                      return RoundButton(
                          loading: provider.loading ,
                          title: "Forget", onpressed: (){
                        if(_formkey.currentState!.validate()){
                          provider.forgotPass(context, emailController.text.toString());
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
