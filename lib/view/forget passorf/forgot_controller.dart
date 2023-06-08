import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:social_media_firebase/utils/routes/routes_name.dart';
import 'package:social_media_firebase/utils/utils.dart';
import 'package:social_media_firebase/view_model/services/session_manager.dart';

class ForgotController with ChangeNotifier{

  FirebaseAuth auth = FirebaseAuth.instance;
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading=value;
    notifyListeners();
  }
  void forgotPass(BuildContext context,String email){
    setLoading(true);

    try{
      auth.sendPasswordResetEmail(email: email).then((value) {
        setLoading(false);
        Navigator.pushNamed(context, RoutesNames.loginScreen);
        Utils.toasMessege("Please check your Email");
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