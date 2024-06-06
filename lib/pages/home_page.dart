import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:maandeeq_app/models/product.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // list of products
  List<Product> products = [];

  // Products method
  Future getProducts() async {
    var resp = await http
        .get(Uri.https('web-production-6aa6.up.railway.app', 'api/product/'));
    var jsonData = jsonDecode(resp.body);
    for (var eachProduct in jsonData) {
      final product = Product(
        name: eachProduct['name'],
        price: double.parse(eachProduct['price']),
        rating: eachProduct['rating'],
        productImage: eachProduct['product_image'],
      );
      products.add(product);
    }
    print(products.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: const BoxDecoration(color: Colors.black38),
                  width: 100,
                  height: 100,
                  child: Column(
                    children: [
                      Image.network(
                        products[index].product_image,
                        width: 50,
                        height: 50,
                      ),
                      Text(
                        products[index].name,
                      ),
                      Text(
                        products[index].price.toString(),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
