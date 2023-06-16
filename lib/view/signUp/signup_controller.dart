import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:social_media_firebase/utils/routes/routes_name.dart';
import 'package:social_media_firebase/utils/utils.dart';

import '../../view_model/services/session_manager.dart';

class SignUpController with ChangeNotifier{

  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');

   bool _loading = false;
   bool get loading => _loading;

   setLoading(bool value){
     _loading=value;
     notifyListeners();
   }
   void signUp(BuildContext context,String username,String email,String password){

     try{
       setLoading(true);
       //SessionController().Uid = value.user?.Uid.toString(); with SessionController().uid = value.user?.uid;.
       auth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
         SessionController().uid=value.user?.uid.toString();
         setLoading(false);
         String id = DateTime.now().millisecond.toString();
         ref.child(id).set({
           'uid':id,
           'email':value.user!.email.toString(),
           'online status': "noOne",
           'username': username,
           'phone':"",
           'profile':"",
         }).then((value) {
           setLoading(false);
         }).onError((error, stackTrace) {
           setLoading(false);
           Utils.toasMessege(error.toString());
         });
         Utils.toasMessege('User created Succesfully');
         Navigator.pushNamed(context, RoutesNames.dashBoard);
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