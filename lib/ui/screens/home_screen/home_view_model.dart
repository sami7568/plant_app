
import 'dart:ui';

import 'package:antonx/core/model/cat_type_model.dart';
import 'package:antonx/core/services/database_service.dart';
import 'package:antonx/core/viewModel/base_view_model.dart';
import 'package:antonx/locator.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/model/product_detail_model.dart';
import '../../../../core/model/recent_view_model.dart';

class HomeViewModel extends BaseViewModel{
final dbService = locator<DataBaseServices>();

  final List<RecentView> _recentView = [
    RecentView(title: "Catholea",subTitle: "It\'s spine don\'t grow",imageUrl: "assets/indoor_plant.jpeg"),
    RecentView(title: "Steph",subTitle: "It\'s spine don\'t grow",imageUrl: "assets/indoor_plant.jpeg"),
    RecentView(title: "Catholea",subTitle: "It\'s spine don\'t grow",imageUrl: "assets/indoor_plant.jpeg"),
  ];

  final List<CatType> _catType =  [
    CatType(type: "Recommend",ontap: true),
    CatType(type: "Top",ontap: false),
    CatType(type: "Indoor",ontap: false),
    CatType(type: "Outdoor",ontap: false),
  ];

  final List<ProductsData> _products= [
    ProductsData(
        totalprice:25.00,
      subTitle: "Peace Lily", imageUrl: "assets/leaf.png",title: "Indoor", price: 25.00,rating: 3.5,
        info: "However they look like huge white flowers, and they bloom throughout the year and a bit more frequently in the springtime. This coupled with the plant\'s broard, deep green leaves.",
        itemcount: 1,
        condition: [
          Condition(type: "Height",value: "8.2\""),
          Condition(type: "Humidity",value: "62\%"),
          Condition(type: "Temperature",value: "35")
        ]),
    ProductsData(
      totalprice: 25.00,
      subTitle: "Shefflera",
        imageUrl: "assets/indoor_plant.jpeg",title: "Outdoor", price: 25.00,rating: 4,
        info: "However they look like huge white flowers, and they bloom throughout the year and a bit more frequently in the springtime. This coupled with the plant\'s broard, deep green leaves.",
        itemcount: 1,
        condition: [
          Condition(type: "Height",value: "8.2\""),
          Condition(type: "Humidity",value: "62\%"),
          Condition(type: "Temperature",value: "35")
        ]),
    ProductsData(
        totalprice: 23.00,
        subTitle: "Peace lily",
        imageUrl: "assets/indoor_plant.jpeg",title: "Indoor", price: 23.00,rating: 3,
        info: "However they look like huge white flowers, and they bloom throughout the year and a bit more frequently in the springtime. This coupled with the plant\'s broard, deep green leaves.",
        itemcount: 1,
        condition: [
          Condition(type: "Height",value: "8.2\""),
          Condition(type: "Humidity",value: "62\%"),
          Condition(type: "Temperature",value: "35")
        ]),
    ProductsData(
      subTitle: "Schefflera",
        imageUrl: "assets/indoor_plant.jpeg",title: "Outdoor", price: 25.00,rating: 3.5,
        info: "However they look like huge white flowers, and they bloom throughout the year and a bit more frequently in the springtime. This coupled with the plant\'s broard, deep green leaves.",
        itemcount: 1,totalprice: 25.00,
        condition: [
          Condition(type: "Height",value: "8.2\""),
          Condition(type: "Humidity",value: "62\%"),
          Condition(type: "Temperature",value: "35")
        ]),
  ];

  List<RecentView> get recentView =>_recentView;

  List<CatType> get catType =>_catType;

  List<ProductsData> get product => _products;
}