import 'package:flutter/material.dart';
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

class HomeTab extends StatefulWidget {
  final Function(Hotel) onHotelTap;

  const HomeTab({
    super.key,
    required this.onHotelTap,
  });

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final TextEditingController _searchController = TextEditingController();

  late List<Hotel> filteredHotels;

  @override
  void initState() {
    super.initState();
    filteredHotels = List.from(hotels);
  }

  void _filterHotels(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredHotels = List.from(hotels);
      } else {
        filteredHotels = hotels.where((hotel) {
          return hotel.name.toLowerCase().contains(query.toLowerCase()) ||
              hotel.city.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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

            SearchBarWidget(
              controller: _searchController,
              onChanged: _filterHotels,
            ),

            const SizedBox(height: 25),

            const SectionTitle(
              title: "Popular Hotels",
            ),
            if (filteredHotels.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.search_off,
                        size: 70,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 15),
                      Text(
                        "No hotels found",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Try searching with another name or city.",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
            ...filteredHotels.map(
                  (hotel) => HotelCard(
                    hotel: hotel,
                hotelName: hotel.name,
                city: hotel.city,
                rating: hotel.rating,
                price: hotel.price,
                onTap: () => widget.onHotelTap(hotel),
              ),
            ),

            const SizedBox(height: 20),

            const SectionTitle(
              title: "Recommended",
            ),
          ],
        ),
      ),
    );
  }
}