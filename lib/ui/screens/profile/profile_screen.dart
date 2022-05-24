
import 'package:antonx/ui/screens/home_screen/widgets/body_head.dart';
import 'package:antonx/ui/screens/profile/profile_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context)=>ProfileViewModel(),
      child: Consumer<ProfileViewModel>(
        builder: (context,model,child){
          return Scaffold(
            body: Stack(
              children: [

              ],
            ),
          );
        },

      ),
    );
  }
}
