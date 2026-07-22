import 'package:flutter/material.dart';
import 'bookings_screen.dart';
import 'profile_screen.dart';
import 'favourites_screen.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/hotel_card.dart';
import '../widgets/section_title.dart';
import '../../../data/dummy_data.dart';
import '../../../models/hotel.dart';
import 'hotel_details_screen.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _pages = [
    HomeTab(
      onHotelTap: _openHotelDetails,
    ),
    const BookingsScreen(),
    const FavouritesScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _openHotelDetails(Hotel hotel) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HotelDetailsScreen(
          hotel: hotel,
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online),
            label: "Bookings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  final Function(Hotel) onHotelTap;

  const HomeTab({
    super.key,
    required this.onHotelTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Good Morning 👋",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Where would you like to stay?",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            const SearchBarWidget(),

            const SectionTitle(
              title: "Popular Hotels",
            ),

            ...hotels.map(
                  (hotel) => HotelCard(
                hotelName: hotel.name,
                city: hotel.city,
                rating: hotel.rating,
                price: hotel.price,
                    onTap: () => onHotelTap(hotel),
              ),
            ),

            const SectionTitle(
              title: "Recommended",
            ),

          ],
        ),
      ),
    );
  }
}