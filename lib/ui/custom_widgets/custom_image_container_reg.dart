import 'package:flutter/material.dart';
class CustomImageContainer extends StatelessWidget {
  CustomImageContainer({Key? key, required this.image,}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration:  BoxDecoration(
          image: DecorationImage(
              image: AssetImage("$image")
          )
      ),
    );
  }
}
