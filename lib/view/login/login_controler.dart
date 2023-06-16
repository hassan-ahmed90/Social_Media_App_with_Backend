import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:social_media_firebase/utils/routes/routes_name.dart';
import 'package:social_media_firebase/utils/utils.dart';
import 'package:social_media_firebase/view_model/services/session_manager.dart';

class LoginController with ChangeNotifier{

  FirebaseAuth auth = FirebaseAuth.instance;
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading=value;
    notifyListeners();
  }
  void login(BuildContext context,String email,String password){
    setLoading(true);

    try{
      auth.signInWithEmailAndPassword(email: email, password: password).then((value) {
        SessionController().uid=value.user?.uid.toString();

        setLoading(false);
        Utils.toasMessege("Succesfully Login");
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