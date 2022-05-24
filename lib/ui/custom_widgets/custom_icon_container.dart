import 'package:antonx/ui/screens/home_screen/home_view_model.dart';
import 'package:flutter/material.dart';

class CustomIconConatiner extends StatelessWidget {
  CustomIconConatiner({Key? key, required this.icon, required this.color, required this.iconColor, required this.size,}) : super(key: key);
  final IconData icon;final Color color;final Color iconColor;final double size;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(size),),
          child:  Icon(icon,size: 22,color: iconColor,),
        ),
      ],
    );
  }
}

