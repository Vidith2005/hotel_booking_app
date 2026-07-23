import 'package:flutter/material.dart';

import '../../../models/hotel.dart';

class BookingScreen extends StatefulWidget {
  final Hotel hotel;

  const BookingScreen({
    super.key,
    required this.hotel,
  });

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book ${widget.hotel.name}"),
      ),

      body: const Center(
        child: Text(
          "Booking Screen",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}