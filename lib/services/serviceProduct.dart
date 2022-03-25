import 'dart:convert';
import 'dart:io';

import 'package:app_vesti/model/product.dart';

class ServiceProduct {

  String baseUrl = "https://fakestoreapi.com/products/";

    Future<Product> requestSingleProduct(int id) async {
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(baseUrl+"${id}"));
    request.headers.set('content-type', 'application/json');
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    httpClient.close();

    var productJson = json.decode(reply);
    Product product = Product(
        id: productJson["id"],
        title: productJson["title"],
        rating: productJson["rating"][0],
        category: productJson["category"],
        description: productJson["description"],
        image: productJson["image"],
        price: productJson["price"]
    );

    product.toJson();

    return product;
  }



}