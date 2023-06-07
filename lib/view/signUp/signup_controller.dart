import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:social_media_firebase/utils/utils.dart';

class SignUpController with ChangeNotifier{

  FirebaseAuth auth = FirebaseAuth.instance;

   bool _loading = false;
   bool get loading => _loading;

   setLoading(bool value){
     _loading=value;
     notifyListeners();
   }
   void signUp(String username,String email,String password){

     try{
       setLoading(true);

       auth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
         setLoading(false);
         Utils.toasMessege('User created Succesfully');
       }).onError((error, stackTrace) {
         setLoading(false);
         Utils.toasMessege(error.toString());
       });

     }catch(e){
       setLoading(false);
       Utils.toasMessege(e.toString());

     }

   }

}