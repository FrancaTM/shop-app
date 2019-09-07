import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

// import 'package:my_shop_app/models/http_exception.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  void _setFavoriteValue(bool newValue) {
    isFavorite = newValue;
    notifyListeners();
  }

  Future<void> toggleFavoriteStatus(String token) async {
    final oldFavoriteStatus = isFavorite;

    isFavorite = !isFavorite;
    notifyListeners();

    final url =
        'https://flutter-shop-app-3cfa0.firebaseio.com/products/$id.json?auth=$token';
    try {
      final response = await http.patch(
        url,
        body: json.encode({
          'isFavorite': isFavorite,
        }),
      );

      if (response.statusCode >= 400) {
        _setFavoriteValue(oldFavoriteStatus);
        // throw HttpEx ception('Could not favorite product');
      }
    } catch (error) {
      _setFavoriteValue(oldFavoriteStatus);
    }
  }
}
