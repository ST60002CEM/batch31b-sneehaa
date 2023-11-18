
import 'package:flutter/material.dart';

class HotelCard extends StatelessWidget {
  final String hotelName;
  final String imageAsset;
  final String price;

  const HotelCard({
    required this.hotelName,
    required this.imageAsset,
    required this.price,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageAsset,
            height: 150.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              hotelName,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Price: $price per night',
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}