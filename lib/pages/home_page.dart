import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Products method
  Future getProducts() async {
    var resp = await http.get(Uri.http(''));

    try {
      if (resp.statusCode == 200) {
        var data = json.decode(resp.body);
        print(data);
      } else {
        throw Exception('failed');
      }
    } catch (e) {
      print('Error is: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    getProducts();
    return const Scaffold();
  }
}
