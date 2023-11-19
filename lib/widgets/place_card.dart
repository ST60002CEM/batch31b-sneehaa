import 'package:flutter/material.dart';

class PlaceInfo {
  final AssetImage imageAsset;
  final String hotelName;
  final String location;
  final int rating;

  PlaceInfo({
    required this.imageAsset,
    required this.hotelName,
    required this.location,
    required this.rating,
  });
}

class PlaceCard extends StatelessWidget {
  final PlaceInfo placeInfo;
  // final bool isFavorite;
  // final VoidCallback onFavoritePressed;

  PlaceCard({
    required this.placeInfo,
    // required this.isFavorite,
    // required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200.0,
            child: AspectRatio(
              aspectRatio: 16 / 9, // Adjust the aspect ratio as needed
              child: Image(
                image: placeInfo.imageAsset,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  placeInfo.hotelName,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  placeInfo.location,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      placeInfo.rating.toString(),
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Align(
          //   alignment: Alignment.topRight,
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: IconButton(
          //       icon: Icon(
          //         isFavorite ? Icons.favorite : Icons.favorite_border,
          //         color: Colors.red,
          //       ),
          //       onPressed: onFavoritePressed,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
