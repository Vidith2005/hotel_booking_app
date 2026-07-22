import 'package:flutter/material.dart';

class HotelierHomeScreen extends StatefulWidget {
  const HotelierHomeScreen({super.key});

  @override
  State<HotelierHomeScreen> createState() => _HotelierHomeScreenState();
}

class _HotelierHomeScreenState extends State<HotelierHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBar(centerTitle: true, title: const Text("Hotelier Home Screen")

    );
  }
}
