import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_fake_api/model/model.dart';
import 'package:http/http.dart' as http;
// import 'product_model.dart';

class ProductService {
  static Future<List<Products>> fetchProducts() async {
    
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);      
      return jsonResponse.map((e) => Products.fromJson(e)).toList(); 
        
  }  
    else{
      throw Exception("Failed to laod products");
    }
  
}

}


// {
//         final price = e["price"];
//         if(price is int){
//           e["price"] = price.toDouble();
//         }
//           return Products(
//           id: e["id"], 
//           title: e["title"], 
//           price: e["price"] ,
//           description: e["description"], 
//           category: e["category"], 
//           image: e["image"], 
//           rating: Rating.fromJson(e["rating"])
//           );
//       }