import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

class InputTextFormField extends StatelessWidget {
   InputTextFormField({super.key, required this.hintText,required this.controller,
     required this.prefixIcon, required this.obsecuretext, this.onchanged, this.validator});

   final TextEditingController controller;
   final String hintText;final Icon prefixIcon; final bool obsecuretext;final onchanged;final validator;

   @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchanged,
      obscureText: obsecuretext,
      cursorColor: mainColor,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        fillColor: lightgreenColor,
        hintText: hintText,
        hintStyle: const TextStyle(color: mainColor,fontSize: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
        prefixIcon: prefixIcon,

      ),

    );
  }
}
