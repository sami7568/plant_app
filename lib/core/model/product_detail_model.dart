import 'package:flutter/material.dart';

class ProductsData{
  String? imageUrl;
  String? title;
  String? subTitle;
  String? info;
  double? price;
  double? totalprice;
  double? rating;
  List<Condition>? condition;
  int? itemcount;
  ProductsData({this.title,this.subTitle,this.imageUrl,this.price,this.rating,this.info,this.itemcount,this.condition,this.totalprice});

}

class Condition{
  String? type;
  Icon? icon;
  String? value;
  Condition({this.type,this.value});



}