import '../models/hotel.dart';

class FavoriteManager {
  static final List<Hotel> _favorites = [];

  static List<Hotel> get favorites => _favorites;

  static bool isFavorite(Hotel hotel) {
    return _favorites.contains(hotel);
  }

  static void addFavorite(Hotel hotel) {
    _favorites.add(hotel);
  }

  static void removeFavorite(Hotel hotel) {
    _favorites.remove(hotel);
  }

  static void toggleFavorite(Hotel hotel) {
    if (isFavorite(hotel)) {
      removeFavorite(hotel);
    } else {
      addFavorite(hotel);
    }
  }
}