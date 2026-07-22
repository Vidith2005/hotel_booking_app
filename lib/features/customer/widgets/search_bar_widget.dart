import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search hotels, cities...",
        prefixIcon: const Icon(Icons.search),
        suffixIcon: const Icon(Icons.mic),
        filled: true,
        fillColor: Colors.grey.shade200,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}