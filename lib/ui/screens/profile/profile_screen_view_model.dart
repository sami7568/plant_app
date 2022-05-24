

import 'package:antonx/core/services/auth_service.dart';
import 'package:antonx/core/viewModel/base_view_model.dart';
import 'package:antonx/locator.dart';

class ProfileViewModel extends BaseViewModel{

  final authResult = locator<AuthResult>();
  ProfileViewModel(){
    getUserData();
  }

  getUserData(){

  }
}