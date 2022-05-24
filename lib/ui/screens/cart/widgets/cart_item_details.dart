import 'package:antonx/core/constants/colors.dart';
import 'package:antonx/core/constants/text_style.dart';
import 'package:antonx/core/model/product_detail_model.dart';
import 'package:antonx/ui/screens/product_detail/product_detail_view_model.dart';
import "package:flutter/material.dart";

import 'item_count.dart';
class CartItemsDetail extends StatelessWidget {
  CartItemsDetail({
    Key? key, required this.model,
  }) : super(key: key);
  ProductDetailViewModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height/1.55,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: model.cart!.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onLongPress: (){
              model.cart![index];
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Container(
                height: 100,
                // color: lightgreenColor,
                decoration: BoxDecoration(
                    color: lightgreenColor,
                    borderRadius: BorderRadius.circular(10)
                ),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 15, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 70,
                            width: 60,
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(10),
                              image:  DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("${model.cart![index].imageUrl}",)
                              ),
                            ),
                          ),
                          const SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("${model.cart![index].subTitle}",style:  headingTextStyle.copyWith(fontSize: 20)),
                              Expanded(child: Text("It's spines don't grow",style: headingTextStyle.copyWith(fontSize: 16))),
                              const SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ItemCountButton(model: model, action: (){model.decrementCount(model.cart![index]);}, sign: "-"),
                                  const SizedBox(width: 13,),
                                  Text("${model.cart![index].itemcount}",style: const TextStyle(fontSize: 18),),
                                  const SizedBox(width: 13,),
                                  ItemCountButton(model: model, sign:"+", action: (){model.incrementCount(model.cart![index]);}),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                                onTap: (){
                                  ///pop up menu to delete the item from list
                                },
                                child: const Icon(Icons.more_vert)
                            ),
                            Text("\$${model.cart![index].totalprice}",style:  const TextStyle(color: mainColor,fontSize: 17,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
