import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:social_media_firebase/view_model/services/session_manager.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ref = FirebaseDatabase.instance.ref('User');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: StreamBuilder(
          stream: ref.child(SessionController().Uid.toString()).onValue,
          builder: (context,AsyncSnapshot snapshot){
            if(!snapshot.hasData){
              return CircularProgressIndicator();
            }else if(snapshot.hasData){
              Map<dynamic,dynamic> map = snapshot.data.snapshot.value;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      height: 130,
                      width: 130,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(
                          image: AssetImage('assets/images/hassan.png'),
                        ),
                      ),
                    ),
                  ),
            ListTile(
            title: Text(map['userName']),
            ),
                ],
              );
            }else{
              return Center(child: Text("Something went wrong yara"),);

            }
          },
        )
      ),
    );
  }
}
