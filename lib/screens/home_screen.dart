import 'package:bookaway/screens/bottomview/explore_view.dart';
import 'package:bookaway/screens/bottomview/favorites_view.dart';
import 'package:bookaway/screens/bottomview/home_view.dart';
import 'package:bookaway/screens/bottomview/profile_screen.dart';
import 'package:bookaway/widgets/carousel_slider.dart';
import 'package:bookaway/widgets/featured_destinations.dart';
import 'package:bookaway/widgets/popular_places.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> lstBottomScreen = [
    const HomeView(),
    const ExploreView(),
    const FavoritesView(),
    const ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eplore Hotels'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Discover',
                style: TextStyle(
                  fontFamily: 'Agbalumo',
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search for hotels...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.0),
                    )),
              ),
            ),
            CarouselSliderWidget(),
            FeaturedDestinations(),
            PopularPlacesWidget(),
            lstBottomScreen[_selectedIndex],
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: const Color.fromARGB(255, 161, 138, 221),
        unselectedItemColor: const Color.fromARGB(255, 213, 134, 134),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
