import 'package:antonx/ui/screens/home_screen/home_view_model.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/colors.dart';

class CategoryType extends StatelessWidget {
   CategoryType({Key? key,this.model}) : super(key: key);
  HomeViewModel? model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      child: SizedBox(
        height: 35,
        child: ListView.builder(
          itemCount: model!.catType.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: model!.catType[index].ontap!
                  ? GestureDetector(
                      onTap: () {
                        print("tapped");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: lightgreenColor,
                            borderRadius: BorderRadius.circular(100)),
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 6, 20, 6),
                            child: Text(
                              model!.catType[index].type!,
                              style: const TextStyle(
                                  fontSize: 17,
                                  color: mainColor,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(14, 6, 0, 6),
                      child: Text(
                        model!.catType[index].type!,
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 17,
                            color: mainColor,
                            fontWeight: FontWeight.bold),
                      )),
            );
          },
        ),
      ),
    );
  }
}
