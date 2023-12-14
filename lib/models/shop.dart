import 'package:commerce_application/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {

  //product for sale

  final List<Product> _shop = [
    Product(imagePath: 'assets/sunglass.webp', name: "Sunglass", price: 99.99, description: "Item Description.."),
    Product(imagePath: 'assets/black-chelsea-boots.png', name: "Chelsea Boots", price: 88.99, description: "Item Description.."),
    Product(imagePath: 'assets/hoodie.png', name: "Hoodie", price: 77.99, description: "Item Description.."),
    Product(imagePath: 'assets/watch.png', name: "Watch", price: 66.99, description: "Item Description..")
  ];

  //user cart
  List<Product> _cart = [];

  //get product
  List<Product> get shop => _shop;

  //get user cart
  List<Product> get cart => _cart;

  //add item to cart
  void addToCart (Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item from cart
  void removeFromCart (Product item) {
    _cart.remove(item);
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0 ;
    for(int i=0;  i<_cart.length; i++) {
      totalPrice += _cart[i].price;
    }
    return totalPrice.toStringAsFixed(2);
  }
}
