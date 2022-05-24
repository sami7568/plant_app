import 'package:antonx/core/enums/view_state.dart';
import 'package:antonx/core/model/sign_up_model.dart';
import 'package:antonx/core/services/auth_service.dart';
import 'package:antonx/core/viewModel/base_view_model.dart';
import 'package:antonx/locator.dart';
import 'package:antonx/ui/custom_widgets/toast_message.dart';
import 'package:antonx/ui/screens/dashboard/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';

class SignupViewModel extends BaseViewModel{

  final authSerice =locator<AuthResult>();

  AppUser appUsers = AppUser();
  final List<AppUser> _users=[];
  List<AppUser> get users => _users;

  signup(){
    setstate(ViewState.busy);
    bool userAlready=false;
    _users.forEach((element) {
      if (element.email == appUsers.email) {
        print("user already sign up");
        userAlready = true;
        return;
      }
    });
    if (userAlready==false) {
      _users.add(AppUser(name: appUsers.name,id: _users.length+1,password: appUsers.password,email: appUsers.email));
      authSerice.appUers = _users;
      flutterToast("Welcom ${appUsers.name}");
      Get.to(Dashboard());
    }
    else {
      Fluttertoast.showToast(
          msg: "User already sign up",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Color(34),
      );
    }
    setstate(ViewState.idle);
  }

}