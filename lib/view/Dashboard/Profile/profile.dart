import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:social_media_firebase/res/colors.dart';
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
    // print('HELLOOOOOOOOOOOOOOOOOOOOOOOO');
    // print(ref.child(SessionController().Uid.toString()).child('username'));
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: StreamBuilder(
          stream: ref.child(SessionController().uid.toString()).onValue,
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
                           fit: BoxFit.cover,
                          image: NetworkImage(

                            'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
                          ),
                         loadingBuilder: (context,child,loadingProgress){
                            if(loadingProgress==null) return child;
                            return CircularProgressIndicator();
                         },
                          errorBuilder: (context,object,stack){
                            return Container(
                              child: Icon(Icons.error_outline,color: AppColors.alertColor,),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
            ListTile(
             title: Text(map['username']),
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
