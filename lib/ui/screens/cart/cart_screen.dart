import 'package:antonx/core/constants/colors.dart';
import 'package:antonx/core/constants/text_style.dart';
import 'package:antonx/ui/custom_widgets/custom_icon_container.dart';
import 'package:antonx/ui/screens/cart/widgets/cart_item_details.dart';
import 'package:antonx/ui/screens/product_detail/product_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailViewModel>(
      builder: (BuildContext context, model, Widget? child) {
        return Scaffold(
          body: Stack(
            fit: StackFit.loose,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: CustomIconConatiner(icon: Icons.arrow_back_ios_rounded, color:lightgreenColor, iconColor: mainColor, size:22)),
                       Text("My Cart",style: headingTextStyle.copyWith(fontSize: 24)
                      ),
                      const Icon(Icons.more_vert,size: 40,),
                    ],
                  ),
                ),
              ),

              Positioned(
                left: 30,
                right: 30,
                top: 90,
                child: model.cart!.isNotEmpty?
                CartItemsDetail(model: model):
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                  child: Center(child: Text("No items in the cart",style: headingTextStyle.copyWith(fontSize: 18,color: greyColor),)),
                ),
              ),

              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height/3.1,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: whiteColor)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            const Text("Subtotal:",style:subtextStyle),
                            Text("\$${model.subtotal}",style: subtextStyle),
                          ],
                        ),
                        const SizedBox(height: 18,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            const Text("Shipping Cost:",style: subtextStyle),
                            model.cart!.isNotEmpty?
                            Text("\$${model.shippingPrice}",style: subtextStyle)
                            :
                            Text("\$0.0",style: subtextStyle),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30,bottom: 30),
                          child: Container(decoration: const BoxDecoration(color: greyColor),height: 2,),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            Text("Total:",style:  headingTextStyle.copyWith(fontSize: 24)),
                            Text("\$${model.totalprice}",style: headingTextStyle.copyWith(fontSize: 22)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 40, 0, 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: mainColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextButton(
                                onPressed: () {  },
                                child:  Text("Place Your Order",style: buttonStyle.copyWith(fontSize: 16)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
