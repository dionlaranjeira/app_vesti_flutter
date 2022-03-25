import 'package:app_vesti/model/product.dart';
import 'package:app_vesti/services/serviceProduct.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import 'dart:io';
void main() async{

    // ServiceProduct serviceProduct = ServiceProduct();
    //
    // var x = await serviceProduct.requestSingleProduct(1);
    //
    // print(x);


    String baseUrl = "https://fakestoreapi.com/products/";

        HttpClient httpClient = new HttpClient();
        HttpClientRequest request = await httpClient.getUrl(Uri.parse(baseUrl+"${1}"));
        request.headers.set('content-type', 'application/json');
        HttpClientResponse response = await request.close();
        String reply = await response.transform(utf8.decoder).join();
        httpClient.close();

        var productJson = json.decode(reply);

        print("--->"+productJson["rating"].toString());

        Product product = Product(
            id: productJson["id"],
            title: productJson["title"],
            rating: productJson["rating"],
            category: productJson["category"],
            description: productJson["description"],
            image: productJson["image"],
            price: productJson["price"]
        );

        product.toJson();

        print(product.rating?.rate);

}