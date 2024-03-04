import 'package:flutter/material.dart';
import 'package:bookaway/core/common/widget/custom_navigation_bar.dart';
import 'package:bookaway/features/hotel_details/domain/entity/hotel_details.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HotelDetailsPage extends ConsumerWidget {
  final HotelDetailsEntity hotelDetailsEntity;

  const HotelDetailsPage({Key? key, required this.hotelDetailsEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hotelDetailsEntity.hotelName),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Display hotel name at the top
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              hotelDetailsEntity.hotelName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Display hotel image in the center and make it bigger
          Expanded(
            child: Center(
              child: Image.network(
                hotelDetailsEntity.hotelImageUrl ?? '',
                height: 300, // Adjust the height as needed
                width: 300, // Adjust the width as needed
              ),
            ),
          ),
         
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description: ${hotelDetailsEntity.hotelDescription}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Price: \$${hotelDetailsEntity.hotelPrice}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Category: ${hotelDetailsEntity.hotelCategory}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          // Add a smaller "Book Now" button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle book now action
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12), // Adjust the padding as needed
                ),
                child: const Text(
                  'Book Now',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/favourites');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/profile');
              break;
          }
        },
      ),
    );
  }
}
