import 'package:antonx/core/constants/text_style.dart';
import 'package:antonx/ui/screens/home_screen/home_view_model.dart';
import 'package:antonx/ui/screens/home_screen/widgets/body_head.dart';
import 'package:antonx/ui/screens/home_screen/widgets/categoryType.dart';
import 'package:antonx/ui/screens/home_screen/widgets/category_item.dart';
import 'package:antonx/ui/screens/home_screen/widgets/recent_viewed.dart';
import 'package:antonx/ui/screens/home_screen/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BodyHead(model: model),
                const Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 40, 20),
                  child: Text(
                    "Let\'s find your plants!",
                    style: headingTextStyle,
                  ),
                ),
                const Search(),
                CategoryType(model: model),
                Products(product: model.product, model: model),
                const Padding(
                  padding: EdgeInsets.fromLTRB(30, 20, 20, 10),
                  child: Text(
                    "Recent Viewed",
                    style: TextStyle(
                        color: mainColor,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                RecentViewed(recent: model.recentView),
              ],
            ),
          );
        },
      ),
    );
  }
}
