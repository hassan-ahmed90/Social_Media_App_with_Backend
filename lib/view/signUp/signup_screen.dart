

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_firebase/res/component/input_text_field.dart';
import 'package:social_media_firebase/res/component/round_button.dart';
import 'package:social_media_firebase/utils/routes/routes_name.dart';
import 'package:social_media_firebase/utils/utils.dart';
import 'package:social_media_firebase/view/signUp/signup_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final userController  = TextEditingController();
  final userFocus= FocusNode();

  final emailController  = TextEditingController();
  final emailFocus= FocusNode();

  final passController  = TextEditingController();
  final passFocus= FocusNode();

  final _formkey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignUpController>(context);
    final height= MediaQuery.of(context).size.height*1;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: ChangeNotifierProvider(
            create: (_)=>SignUpController(),
            child: Consumer<SignUpController>(
              builder: (context,provider,child){
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      SizedBox(height: height*.01,),
                      Text("Hassan Ahmed",style: Theme.of(context).textTheme.displaySmall,),
                      SizedBox(height: height*.01,),

                      Text("Enter your email \n to Register your account",style: Theme.of(context).textTheme.titleMedium,
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
                                      return value.isNull ? "Enter name" :null;
                                    },
                                    myController: userController,
                                    focusNode: userFocus,
                                    onFieldSubmitteedValue: (value){},
                                    keyboradType: TextInputType.text,
                                    hint: "Enter Name"),
                                SizedBox(height: height*.01,),
                                InputTextField(
                                    obscureText: false,
                                    onValidator: (value){
                                      return value.isNull ? "Enter email" :null;
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
                                      return value.isNull ? "Enter password" :null;
                                    },
                                    myController: passController,
                                    focusNode: passFocus,
                                    onFieldSubmitteedValue: (value){

                                      Utils.fieldFocus(context, emailFocus, passFocus);
                                    },
                                    keyboradType: TextInputType.text,
                                    hint: "Password"),

                              ],
                            ),
                          )),

                      //SizedBox(height: 70,),
                      RoundButton(
                        loading:provider.loading,
                          title: "SignUp", onpressed: (){
                        if(_formkey.currentState!.validate()){
                          provider.signUp(userController.text.toString(),
                              emailController.text.toString(),
                              passController.text.toString());

                        }

                      }),
                      SizedBox(height: height*.03,),

                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, RoutesNames.loginScreen);
                          },
                          child: Text.rich(
                              TextSpan(
                                  text: "Already have an account ?",
                                  children: [
                                    TextSpan(
                                        text: "Login",
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(fontSize: 15,
                                            decoration: TextDecoration.underline)
                                    )
                                  ]
                              )
                          )
                      ),


                    ],
                  ),
                );
              },
            ),
          )
        ),
      ),
    );
  }
}
