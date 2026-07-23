import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../services/favourite_manager.dart';
import '../widgets/hotel_card.dart';
import 'hotel_details_screen.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteHotels =
        context.watch<FavoriteManager>().favorites;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Favorites"),
      ),

      body: favoriteHotels.isEmpty
          ? const Center(
        child: Text(
          "No favorite hotels yet ❤️",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: favoriteHotels.length,
        itemBuilder: (context, index) {
          final hotel = favoriteHotels[index];

          return HotelCard(
            hotel: hotel,
            hotelName: hotel.name,
            city: hotel.city,
            rating: hotel.rating,
            price: hotel.price,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HotelDetailsScreen(
                    hotel: hotel,
                  ),
                ),
              ).then((_) {
                setState(() {});
              });
            },
          );
        },
      ),
    );
  }
}