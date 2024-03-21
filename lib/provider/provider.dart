import 'package:flutter/material.dart';
import 'package:flutter_fake_api/model/model.dart';
import 'package:flutter_fake_api/services/service.dart';

class ProductProvider extends ChangeNotifier{
  final _service = ProductService();
  bool isLoading = false;
  List<Products> _product = [];
  List<Products> get product => _product;

  Future<void> getAllProduct() async{
    notifyListeners();
    final response = await ProductService.fetchProducts();

    _product = response;
    isLoading = false;
    notifyListeners();
  }

}

