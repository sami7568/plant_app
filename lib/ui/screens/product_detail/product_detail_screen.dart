import 'package:antonx/core/constants/colors.dart';
import 'package:antonx/core/model/product_detail_model.dart';
import 'package:antonx/ui/custom_widgets/custom_icon_container.dart';
import 'package:antonx/ui/screens/product_detail/product_detail_view_model.dart';
import 'package:antonx/ui/screens/product_detail/widgets/product_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key, required this.productsData}) : super(key: key);

  final ProductsData productsData;
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailViewModel>(
      builder: (context,model,child){
        return Scaffold(
          backgroundColor: Colors.lightGreen.withOpacity(0.89),
          body: Stack(
            children: [
              Positioned(
                left: 30,
                right:30,
                top: 60,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap:(){  Navigator.pop(context);},
                            child: CustomIconConatiner(icon: Icons.arrow_back_ios_outlined, color: whiteColor, iconColor: mainColor,size: 22,)),
                        CustomIconConatiner(icon: Icons.favorite_border_outlined, color: mainColor, iconColor:whiteColor,size: 22,)
                      ],
                    ),
                     Padding(padding: const EdgeInsets.fromLTRB(0, 74, 0, 0),
                        child: Image(image: AssetImage("${productsData.imageUrl}")))
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height/1.75,
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Center(child: Container(height: 4,width: 60,decoration: const BoxDecoration(color: greyColor),)),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 35, 20, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Text("${productsData.subTitle}",style:  const TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: mainColor),),
                                const SizedBox(height: 3,),
                                Row(
                                  children:  [
                                     Text("\$${productsData.price}.00",style: const TextStyle(fontSize: 20,color: Colors.lightGreen,fontWeight: FontWeight.bold),),
                                    const SizedBox(width: 10,),
                                    SmoothStarRating(
                                        allowHalfRating: false,
                                        starCount: 5,
                                        rating: double.parse("${productsData.rating}"),
                                        size: 18.0,
                                        color: Colors.orange,
                                        borderColor: Colors.orange,
                                        spacing:0.0
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              height: 40,
                              width: 110,
                              decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap:(){
                                      model.decrementCount(productsData);
                                    },
                                      child: const Text("-",style: TextStyle(color: whiteColor,fontSize: 23),)),
                                  Text("${productsData.itemcount}",style: const TextStyle(color: whiteColor,fontSize: 20)),
                                  GestureDetector(
                                      onTap: (){
                                        model.incrementCount(productsData);
                                      },
                                      child: const Text("+",style:  TextStyle(color: whiteColor,fontSize: 24))),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 8),
                        child: Text(
                          "About",
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),),),
                       Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                        child: Text(
                          "${productsData.info}",
                          style: const TextStyle(
                            color: Colors.lightGreen,
                            fontSize: 15,
                            fontFamily: "Bangla Sangam MN",
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.01,
                            //wordSpacing: 1
                          ),
                        ),
                      ),
                      ProductInfo(condition: productsData),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                color: lightgreenColor,
                                borderRadius: BorderRadius.circular(50),),
                              child:  const Icon(Icons.shopping_cart_outlined,size: 30,color: mainColor,),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width/1.5,
                              decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child:  Padding(
                                padding: const EdgeInsets.all(5),
                                child: TextButton(
                                  onPressed: () {
                                    //add to cart item
                                    model.addToCart(productsData);
                                    Fluttertoast.showToast(
                                        msg: "Product ${productsData.subTitle} is added to the Card",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.grey,
                                        textColor: Colors.white,
                                        fontSize: 16.0
                                    );

                                  },
                                  child: const Text("Buy Now",style: TextStyle(fontSize: 20,color: whiteColor),),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
