import 'package:bookaway/features/hotel_details/domain/entity/hotel_details_entity.dart';
import 'package:flutter/material.dart';


class HotelDetailsPage extends StatelessWidget {
  final HotelDetails? hotelDetails;

  const HotelDetailsPage({Key? key, this.hotelDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotel Details'),
      ),
      body: hotelDetails != null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Hotel Name: ${hotelDetails!.hotelName}'),
                  Text('Price: ${hotelDetails!.hotelPrice}'),
                  Text('Description: ${hotelDetails!.hotelDescription}'),
                  Text('Category: ${hotelDetails!.hotelCategory}'),
                  Text('Image: ${hotelDetails!.hotelImageUrl}'),
                ],
              ),
            )
          : const Center(
              child: Text('No hotel details available.'),
            ),
    );
  }
}
