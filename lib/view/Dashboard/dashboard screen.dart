import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:social_media_firebase/res/colors.dart';
import 'package:social_media_firebase/utils/routes/routes_name.dart';
import 'package:social_media_firebase/view_model/services/session_manager.dart';
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final controller = PersistentTabController(initialIndex: 0);
  FirebaseAuth auth = FirebaseAuth.instance;
  List<Widget> _buildScreen(){
    return [
      Center(
        child: GestureDetector(
            onTap: (){Navigator.pushNamed(context, RoutesNames.loginScreen);
              },
            child: Text("Home")),
      ),
      Text("Chat"),
      Text("Add"),
      Text("Messege"),
      Text("Profile"),
    ];
  }
  List<PersistentBottomNavBarItem> _navBarItem(){
    return [
      PersistentBottomNavBarItem(icon: Icon(Icons.home),
      activeColorPrimary: AppColors.primaryIconColor,
      inactiveIcon: Icon(Icons.home,color: Colors.grey.shade100)),
      PersistentBottomNavBarItem(icon: Icon(Icons.message),
          activeColorPrimary: AppColors.primaryIconColor,
    inactiveIcon: Icon(Icons.messenger,color: Colors.grey.shade100)),
      PersistentBottomNavBarItem(icon: Icon(Icons.add),
          activeColorPrimary: AppColors.primaryIconColor,
          inactiveIcon: Icon(Icons.add,color: Colors.grey.shade100)),
      PersistentBottomNavBarItem(icon: Icon(Icons.chat),
          activeColorPrimary: AppColors.primaryIconColor,
          inactiveIcon: Icon(Icons.chat,color: Colors.grey.shade100)),
      PersistentBottomNavBarItem(icon: Icon(Icons.person),
          activeColorPrimary: AppColors.primaryIconColor,
          inactiveIcon: Icon(Icons.person,color: Colors.grey.shade100)),

    ];
  }
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context, screens: _buildScreen(),
        items: _navBarItem(),
      backgroundColor: AppColors.otpHintColor,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10),

      ),
      navBarStyle: NavBarStyle.style15,
      controller: controller,

    );
  }
}
