

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_firebase/res/component/input_text_field.dart';
import 'package:social_media_firebase/res/component/round_button.dart';
import 'package:social_media_firebase/utils/routes/routes_name.dart';
import 'package:social_media_firebase/view/login/login_controler.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController  = TextEditingController();
  final emailFocus= FocusNode();

  final passController  = TextEditingController();
  final passFocus= FocusNode();

  final _formkey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.of(context).size.height*1;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SizedBox(height: height*.09,),
                  Text("Shani Fanta",style: Theme.of(context).textTheme.displaySmall,),
                  SizedBox(height: height*.01,),

                  Text("Enter your email \n to connect your account",style: Theme.of(context).textTheme.titleMedium,
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
                            InputTextField(
                                obscureText: true,
                                onValidator: (value){
                                  return value.isEmpty ? "Enter password" :null;
                                },
                                myController: passController,
                                focusNode: passFocus,
                                onFieldSubmitteedValue: (value){
                                },
                                keyboradType: TextInputType.text,
                                hint: "Password"),

                          ],
                        ),
                      )),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, RoutesNames.forgetScreen);

                      },
                      child: Text(
                           "Forger Password",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 15,decoration: TextDecoration.underline)
                      ),
                    ),
                  ),
                  SizedBox(height: height*.03,),



                  //SizedBox(height: 70,),
                  ChangeNotifierProvider(create: (_)=>LoginController(),
                  child: Consumer<LoginController>(
                    builder: (context,provider,child){
                      return RoundButton(title: "Login",loading: provider.loading, onpressed: (){
                        if(_formkey.currentState!.validate()){
                          provider.login(context, emailController.text.toString(), passController.text.toString());
                        }

                      });
                    },
                  ),
                  ),
                  SizedBox(height: height*.03,),

                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, RoutesNames.signupcreen);
                    },
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, RoutesNames.signupcreen);
                      },
                      child: Text.rich(
                         TextSpan(
                           text: "Dont have an account ?",
                           children: [
                             TextSpan(
                               text: "SignUp",
                               style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 15,decoration: TextDecoration.underline)
                             )
                           ]
                         )
                      ),
                    ),
                  )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
