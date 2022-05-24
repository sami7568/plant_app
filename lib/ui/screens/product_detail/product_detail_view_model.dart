import 'package:antonx/core/model/product_detail_model.dart';
import 'package:antonx/core/services/database_service.dart';
import 'package:antonx/core/viewModel/base_view_model.dart';
import 'package:antonx/locator.dart';
import 'package:get/route_manager.dart';

class ProductDetailViewModel extends BaseViewModel{

  final dbService = locator<DataBaseServices>();

  final List<ProductsData> _cart=[];

  double _totalPrice=0.00;

  final double _shippingPrice = 14.00;

  double _subtotal = 0.00;

  List<ProductsData>? get cart => _cart;

  double get totalprice => _totalPrice;

  double get shippingPrice =>_shippingPrice;

  double get subtotal =>_subtotal;

  incrementCount(ProductsData? productsData){
    print('itemCount => ${productsData!.itemcount}');
    productsData.itemcount =productsData.itemcount! + 1;
    productsData.totalprice = productsData.price! * productsData.itemcount!;
    countTotalPrice();
    notifyListeners();
  }

  decrementCount(ProductsData? productsData){
    print('itemCount => ${productsData!.itemcount}');
    if(productsData.itemcount! <2){
      return ;
    }
    productsData.itemcount=productsData.itemcount!-1;
    productsData.totalprice = productsData.price! * productsData.itemcount!;
    countTotalPrice();
    notifyListeners();
  }

  addToCart(ProductsData product){
    if (_cart.isNotEmpty) {
      int index = 0;
      for (var element in _cart) {
        if (element.subTitle == product.subTitle) {

          _cart[index].itemcount = _cart[index].itemcount! + element.itemcount!;
          _cart[index].totalprice = _cart[index].price! * _cart[index].itemcount!;
          dbService.isProductInCart = true;
          dbService.totalitems= _cart.length;
          countTotalPrice();
          Get.back(result: dbService.totalitems);
          return;
        }
        index ++;
      }
    }

    ///
    _cart.add(product);

    dbService.isProductInCart = true;
    dbService.totalitems= _cart.length;
    countTotalPrice();
    Get.back(result: dbService.totalitems);
    notifyListeners();
  }

  countTotalPrice(){
    double totalprice=0.0;
    for (var element in _cart) {
      totalprice += element.totalprice!;
    }
    _subtotal = totalprice;
    _totalPrice = totalprice + _shippingPrice;
    notifyListeners();
  }

}