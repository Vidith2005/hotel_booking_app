import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/hotel.dart';
import '../../../services/favourite_manager.dart';

class HotelCard extends StatefulWidget {
  final Hotel hotel;
  final String hotelName;
  final String city;
  final double rating;
  final int price;
  final VoidCallback? onTap;

  const HotelCard({
    super.key,
    required this.hotel,
    required this.hotelName,
    required this.city,
    required this.rating,
    required this.price,
    this.onTap,
  });

  @override
  State<HotelCard> createState() => _HotelCardState();
}

class _HotelCardState extends State<HotelCard> {
  @override
  Widget build(BuildContext context) {
    final favoriteManager = context.watch<FavoriteManager>();

    final bool isFavorite =
    favoriteManager.isFavorite(widget.hotel);

    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: widget.onTap,
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              child: Image.network(
                "https://picsum.photos/400/220",
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.hotelName,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      IconButton(
    onPressed: () {
    favoriteManager.toggleFavorite(widget.hotel);
    },
                        icon: Icon(
                          isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: isFavorite
                              ? Colors.red
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),

                      const SizedBox(width: 5),

                      Text(widget.rating.toString()),

                      const Spacer(),

                      const Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 20,
                      ),

                      Text(widget.city),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Text(
                        "₹${widget.price} / night",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.indigo,
                        ),
                      ),

                      const Spacer(),

                      const Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}