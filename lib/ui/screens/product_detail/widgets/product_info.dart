import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/model/product_detail_model.dart';
class ProductInfo extends StatelessWidget {
   ProductInfo({
    Key? key, this.condition
  }) : super(key: key);

 final  ProductsData? condition;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        itemCount: condition!.condition!.length,
          scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
        return  Padding(
            padding:const EdgeInsets.fromLTRB(30, 20, 30, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: const Padding(
                    padding:  EdgeInsets.all(10),
                    child:  Icon(Icons.hdr_weak,color: whiteColor,),
                  ),
                ),
                const SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(condition!.condition![index].type!,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: lightgreenColor),),
                    const SizedBox(height: 8,),
                    Text("${condition!.condition![index].value}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: mainColor)),
                  ],
                )
              ],
            )
        );
        }
      ),
    );
  }
}
