import 'package:bookaway/features/hotel_details/presentation/view/booking.dart';
import 'package:flutter/material.dart';
import 'package:bookaway/core/common/widget/custom_navigation_bar.dart';
import 'package:bookaway/features/hotel_details/domain/entity/hotel_details.dart';

class HotelDetailsPage extends StatefulWidget {
  final HotelDetailsEntity hotelDetailsEntity;

  const HotelDetailsPage({Key? key, required this.hotelDetailsEntity})
      : super(key: key);

  @override
  _HotelDetailsPageState createState() => _HotelDetailsPageState();
}

class _HotelDetailsPageState extends State<HotelDetailsPage> {
  bool showBookingForm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.hotelDetailsEntity.hotelName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
            ),
            Center(
              child: Image.network(
                widget.hotelDetailsEntity.hotelImageUrl ?? '',
                height: 300,
                width: 300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description: ${widget.hotelDetailsEntity.hotelDescription}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Price: \$${widget.hotelDetailsEntity.hotelPrice}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Category: ${widget.hotelDetailsEntity.hotelCategory}',
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
                  onPressed: () {
                    setState(() {
                      showBookingForm = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    'Book Now',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
            if (showBookingForm)
              BookingForm(hotelId: widget.hotelDetailsEntity.hotelId),
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
