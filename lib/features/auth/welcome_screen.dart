import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Spacer(),

              const Icon(
                Icons.hotel,
                size: 90,
                color: Colors.indigo,
              ),

              const SizedBox(height: 20),

              const Text(
                "Welcome!",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                "Find and book the perfect hotel anywhere in the world.",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {

                  },
                  child: const Text(
                    "Get Started",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}