import 'package:flutter/material.dart';
import 'package:bookaway/core/common/widget/custom_navigation_bar.dart';
import 'package:bookaway/features/hotel_details/domain/entity/hotel_details.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class HotelDetailsPage extends ConsumerWidget {
  final HotelDetailsEntity hotelDetailsEntity;

  const HotelDetailsPage({Key? key, required this.hotelDetailsEntity})
      : super(key: key);

  Future<void> _bookHotel(BuildContext context) async {
    final url = Uri.parse('http://localhost:5500/api/booking/book_hotel/${hotelDetailsEntity.hotelId}');
    final response = await http.post(
      url,
      body: {
        'numberOfRooms': '1', // Example value, replace with actual value
        'numberOfAdults': '2', // Example value, replace with actual value
        'numberOfChildren': '0', // Example value, replace with actual value
        'checkInDate': '2024-03-10', // Example value, replace with actual value
        'checkOutDate': '2024-03-12', // Example value, replace with actual value
      },
      headers: {
        'Authorization': 'Bearer YOUR_ACCESS_TOKEN', // Example value, replace with actual value
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 201) {
      // Booking successful
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Hotel booked successfully')),
      );
    } else {
      // Booking failed
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to book hotel. Please try again later.')),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hotelDetailsEntity.hotelName),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
          Expanded(
            child: Center(
              child: Image.network(
                hotelDetailsEntity.hotelImageUrl ?? '',
                height: 300,
                width: 300,
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _bookHotel(context), // Call _bookHotel function
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
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
