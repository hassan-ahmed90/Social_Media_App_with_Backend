
import 'package:flutter/material.dart';
import 'package:social_media_firebase/utils/routes/routes_name.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Center(child: InkWell(
            onTap: (){
              Navigator.pushNamed(context,RoutesNames.signupcreen);
            },
            child: Container(
              color: Colors.blueGrey,
              child: Text("LOGIN"),
            ),
          ))
        ],

      ),
    );
  }
}
