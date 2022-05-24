import 'package:antonx/core/constants/colors.dart';
import 'package:antonx/core/constants/text_style.dart';
import "package:flutter/material.dart";
class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text,@required this.onPressed}) : super(key: key);
  final String text;final onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: mainColor,
          border: Border.all(
          ),
          borderRadius: BorderRadius.circular(30)
      ),
      child:  TextButton(
          onPressed: onPressed,
          child: Text(text,style: buttonStyle),
    ));
  }
}
