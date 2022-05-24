
import 'package:antonx/core/enums/view_state.dart';
import 'package:antonx/ui/screens/product_detail/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/model/product_detail_model.dart';
import '../home_view_model.dart';



class Products extends StatelessWidget {

  final List<ProductsData> product;
  final HomeViewModel? model;

  const Products({Key? key, required this.product,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: ListView.builder(
        itemCount: product.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return  Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
            child: GestureDetector(
              onTap: () async{
              model!.dbService.totalitems = await  Get.to(ProductDetailScreen(productsData: product[index],))
              ?? model!.dbService.totalitems;
              model!.setstate(ViewState.idle);
              },
              child: Container(
                // height: 280,
                width: MediaQuery.of(context).size.width/1.84,
                decoration: BoxDecoration(
                    color: lightgreenColor,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipPath(
                          clipper: MyClipper(),
                          child: Container(
                            height: 230,
                            decoration:  BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                         Positioned(
                            top: -110,
                            left: 20,
                            bottom: 0,
                            child: Container(
                              height: 300,
                              width: 160,
                              /*decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/76-762822_pleasures-in-helping-others-transparent-background-indoor-plant.png")
                                )
                              ),*/
                              child:  Image(
                                image: AssetImage("${product[index].imageUrl}",),
                              ),
                            )
                         )
                      ],
                    ),
                    Container(
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                             Text("${product[index].title}",style:TextStyle(fontSize: 19,color: mainColor),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:  [
                                 Text("${product[index].subTitle}",style:TextStyle(fontSize: 19),),
                                const SizedBox(height: 30,),
                                Container(
                                    height: 22,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child:  Center(child: Text("\$${product[index].price}",style:const TextStyle(color:greenColor,fontSize: 13,fontWeight: FontWeight.bold),))),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height-30.0);
    var p1 = Offset(size.width/1.45, size.height);
    var p2  = Offset(size.width-0.01,size.height-115.0);

    path.quadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy);
    path.lineTo(size.width,0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
