import 'package:bookaway/widgets/carousel_slider.dart';
import 'package:bookaway/widgets/featured_destinations.dart';
import 'package:bookaway/widgets/popular_places.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          ],
        ),
      ),
    
    );
  }
}
