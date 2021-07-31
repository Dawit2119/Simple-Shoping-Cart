import 'package:counterprovider/Model/product.dart';
import 'package:flutter/material.dart';

class MyStore extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> _baskets = [];
  Product? _activeProduct;
  MyStore() {
    _products = [
      Product(
          id: 1,
          qty: 1,
          name: "Special Burger",
          price: 100.0,
          pic: "burger.jpg"),
      Product(id: 1, qty: 1, name: "Dish", price: 40, pic: "dish.jpg"),
      Product(id: 2, qty: 3, name: "Jacket", price: 400, pic: 'jacket.jpg'),
      Product(id: 3, qty: 10, name: "juice", price: 56, pic: 'juice.jpg'),
      Product(id: 4, qty: 10, name: 'Trouser', price: 500, pic: 'trouser.jpg'),
      Product(id: 5, qty: 3, name: 'Bicycle', price: 7000, pic: 'bicycle.jpg')
    ];
    // notifyListeners();
  }
  List<Product> get products => _products;
  List<Product> get baskets => _baskets;
  Product get activeProduct => _activeProduct!;
  setActiveProduct(Product product) {
    _activeProduct = product;
    notifyListeners();
  }

  bool addToBasket(Product product) {
    if (product.qty > 0) {
      _baskets.add(product);
      product.qty--;
      notifyListeners();
      return true;
    } else {
      notifyListeners();

      return false;
    }
  }

  bool removeFromBasket(Product product) {
    if (_baskets.contains(product)) {
      _baskets.remove(product);
      product.qty++;
      notifyListeners();
      return true;
    } else
    {
      notifyListeners();
      return false;
    }
  }
}
