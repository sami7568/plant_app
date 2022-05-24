

import 'package:antonx/core/model/sign_up_model.dart';
import 'package:antonx/core/services/auth_service.dart';
import 'package:antonx/core/viewModel/base_view_model.dart';
import 'package:antonx/locator.dart';
import 'package:antonx/ui/custom_widgets/toast_message.dart';
import 'package:antonx/ui/screens/dashboard/Dashboard.dart';
import 'package:antonx/ui/screens/home_screen/home_screen.dart';
import 'package:get/route_manager.dart';

class LoginViewModel extends BaseViewModel{

  final authSerice =locator<AuthResult>();

  bool checkremeber = false;
  AppUser user = AppUser();

  setCheckboxValue(bool value){
    checkremeber = value;
    notifyListeners();
  }

  loginWithNameAndPass()async{
    print("");
    if (authSerice.appUers.isNotEmpty) {

      authSerice.appUers.forEach((element) {
        if (element.name==user.name && element.password == user.password) {
          flutterToast("Welcom Back");
          Get.to(Dashboard());
        }
      });
    }
    else{
      flutterToast("User not found");
      print("no user found ");
    }
  }

}