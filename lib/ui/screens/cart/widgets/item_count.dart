import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../product_detail/product_detail_view_model.dart';
class ItemCountButton extends StatelessWidget {
  const ItemCountButton({
    Key? key,
    required this.model,required this.action,required this.sign
  }) : super(key: key);

  final ProductDetailViewModel model;final action;final String sign;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        height:23,
        width: 23,
        decoration:BoxDecoration(
          //color: mainColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: mainColor,width: 3),
        ),
        child: Center(child: Text(sign)),),
    );
  }
}
