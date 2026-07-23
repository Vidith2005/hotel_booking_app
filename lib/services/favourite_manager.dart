import 'package:flutter/material.dart';

import '../models/hotel.dart';

class FavoriteManager extends ChangeNotifier {
  final List<Hotel> _favorites = [];

  List<Hotel> get favorites => _favorites;

  bool isFavorite(Hotel hotel) {
    return _favorites.contains(hotel);
  }

  void toggleFavorite(Hotel hotel) {
    if (_favorites.contains(hotel)) {
      _favorites.remove(hotel);
    } else {
      _favorites.add(hotel);
    }

    notifyListeners();
  }
}