
import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> flutterToast(String mess){
  return Fluttertoast.showToast(
    msg: "$mess",
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.SNACKBAR,
    backgroundColor: Color(34),
  );
}