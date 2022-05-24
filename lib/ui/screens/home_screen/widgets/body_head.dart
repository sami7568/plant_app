import 'package:antonx/ui/custom_widgets/custom_icon_container.dart';
import 'package:antonx/ui/screens/cart/cart_screen.dart';
import 'package:antonx/ui/screens/home_screen/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/colors.dart';

class BodyHead extends StatelessWidget {
   BodyHead({
    Key? key,this.model
  }) : super(key: key);

  HomeViewModel? model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 50, 30, 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundImage:AssetImage("assets/profile_image.jpeg"),
          ),
          GestureDetector(
              onTap: (){Get.to(const CartScreen());},
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(color: mainColor,borderRadius: BorderRadius.circular(50),),
                    child: const Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                  ),
                  model!.dbService.isProductInCart==true?
                  Positioned(
                    top: -7,
                    left: -5,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50)
                      ),
                      height: 24,
                      width: 24,
                      child:  Center(child: Text("${model!.dbService.totalitems}",style: TextStyle(color: Colors.white),)),
                    ),
                  ):Container()
                ]
              )),
          //Image(image: AssetImage("assets/leaf2.png")),
        ],
      ),
    );
  }
}
