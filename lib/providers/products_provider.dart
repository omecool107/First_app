import 'package:first_app/products_list.dart';

import '../models/products.dart';
import 'package:flutter/foundation.dart';

class Products with ChangeNotifier{
  List<Product> _items = ProductsList().dummyList;

  List<Product> get items {
    return [..._items];
  }

  Product findMyId(String id){
    return _items.firstWhere((prod) => prod.id == id);    
  }

   void addProduct(Product newProduct){
     _items.add(newProduct);
     notifyListeners();
   }
}