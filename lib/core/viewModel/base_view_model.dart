import 'package:antonx/core/enums/view_state.dart';
import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier{

  ViewState _state = ViewState.idle;

  ViewState get state =>_state;

  void setstate(ViewState state){
    _state = state;
    notifyListeners();
  }
}