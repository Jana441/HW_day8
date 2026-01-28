import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:hw_day8/models/Product.dart';
import 'dart:convert';


class Api {
  String link = "https://dummyjson.com/products";

  Future<List<Product>> getP() async {
    var uri = Uri.parse(link);
    var response = await http.get(uri);
    var result = jsonDecode(response.body);
  
   
    List<Product> list = [];

    
    for (var item in result["products"]) {
      Product p = Product.fromJson(item);
      list.add(p);
    }

    return list;
  }
}
