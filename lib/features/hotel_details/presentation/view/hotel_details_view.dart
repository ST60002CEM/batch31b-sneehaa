import 'package:bookaway/features/hotel_details/domain/entity/hotel_details.dart';
import 'package:flutter/material.dart';

class HotelDetailsPage extends StatefulWidget {
  final HotelDetailsEntity hotelDetailsEntity;

  const HotelDetailsPage({Key? key, required this.hotelDetailsEntity})
      : super(key: key);

  @override
  State<HotelDetailsPage> createState() => _HotelDetailsPageState();
}

class _HotelDetailsPageState extends State<HotelDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotel Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hotel Name: ${widget.hotelDetailsEntity.hotelName}'),
            Text('Price: ${widget.hotelDetailsEntity.hotelPrice}'),
            Text('Description: ${widget.hotelDetailsEntity.hotelDescription}'),
            Text('Category:${widget.hotelDetailsEntity.hotelCategory}'),
            Text('Image:${widget.hotelDetailsEntity.hotelImageUrl}'),
          ],
        ),
      ),
    );
  }
}
