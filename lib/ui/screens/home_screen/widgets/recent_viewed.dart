import 'package:antonx/core/model/recent_view_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';

class RecentViewed extends StatelessWidget {
   RecentViewed({
    Key? key, required this.recent,
  }) : super(key: key);

  final List<RecentView> recent;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        itemCount: recent.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Container(
                width: 250,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                //height: 80,
                child:  ListTile(
                  leading: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child:  Image(image: AssetImage("${recent[index].imageUrl}"),)),
                  title:  Text("${recent[index].title}"),
                  subtitle:  Text("${recent[index].subTitle}"),
                )
            ),
          );
        },),
    );
  }
}
