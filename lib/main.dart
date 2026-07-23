import 'package:flutter/material.dart';
import 'features/auth/login_screen.dart';
import 'features/auth/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'services/favourite_manager.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => FavoriteManager(),
      child: const HotelBookingApp(),
    ),
  );
}

class HotelBookingApp extends StatelessWidget {
  const HotelBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotel Booking',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const WelcomeScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.hotel,
              size: 90,
              color: Colors.indigo,
            ),
            const SizedBox(height: 20),
            const Text(
              "Hotel Booking",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  LoginScreen(),
                  ),
                );
              },
              child: const Text("Continue"),
            ),
          ],
        )
      ),
    );
  }
}