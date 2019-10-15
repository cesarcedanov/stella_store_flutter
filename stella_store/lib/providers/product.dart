import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Product with ChangeNotifier {
  String id;
  String title;
  String description;
  double price;
  String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  void _setFavValue(bool newValue) {
    isFavorite = newValue;
    notifyListeners();
  }

  void toggleFavorite() async {
    final oldValue = isFavorite;
    _setFavValue(!isFavorite);
    final url = 'https://stella-store-flutter.firebaseio.com/products/$id.json';
    try {
      final response = await http.patch(
        url,
        body: json.encode(
          ({'isFavorite': isFavorite}),
        ),
      );
      if (response.statusCode >= 400) {
        _setFavValue(oldValue);
      }
    } catch (error) {
      _setFavValue(oldValue);
    }
  }
}
