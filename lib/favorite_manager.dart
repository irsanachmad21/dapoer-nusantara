import 'package:flutter/material.dart';

class FavoriteManager with ChangeNotifier {
  final List<Map<String, String>> _favoriteFoods = [];

  /// Getter untuk mendapatkan daftar makanan favorit
  List<Map<String, String>> get favorites => _favoriteFoods;

  bool isFavorite(Map<String, String> makanan) {
    return _favoriteFoods.any((item) => item['name'] == makanan['name']);
  }

  void toggleFavorite(Map<String, String> makanan) {
    if (isFavorite(makanan)) {
      _favoriteFoods.removeWhere((item) => item['name'] == makanan['name']);
    } else {
      _favoriteFoods.add(makanan);
    }
    notifyListeners();
  }
}
