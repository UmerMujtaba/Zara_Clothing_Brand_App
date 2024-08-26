
import 'package:http/http.dart' as http; // Assuming you're using http package for API calls
import 'dart:convert';

import '../model/product.dart';

class ProductService {
  final String baseUrl;

  ProductService({this.baseUrl = 'https://api.example.com'});

  Future<Product> getProductById(String productId) async {
    final response = await http.get(Uri.parse('$baseUrl/products/$productId'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Product.fromMap(data); // Make sure Product.fromJson exists
    } else {
      throw Exception('Failed to load product');
    }
  }
}


class LoginState {
  final bool isLoading;
  final String? error;

  LoginState({this.isLoading = false, this.error});
}
