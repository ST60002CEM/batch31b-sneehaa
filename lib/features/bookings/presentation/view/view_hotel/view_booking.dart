import 'package:bookaway/core/common/widget/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

class ViewBookedHotels extends StatefulWidget {
  const ViewBookedHotels({super.key});

  @override
  State<ViewBookedHotels> createState() => _ViewBookedHotelsState();
}

class _ViewBookedHotelsState extends State<ViewBookedHotels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/hotel.jpg',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            const Text(
              'Number of Rooms: 1',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Number of Adults: 1',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Number of Children: 0',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Check-In Date: 2024-03-03 18:15:00',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Check-Out Date: 2024-03-03 18:15:00',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/viewbookedhotels');
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
