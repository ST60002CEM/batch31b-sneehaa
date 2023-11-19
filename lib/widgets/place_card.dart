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

  PlaceCard({
    required this.placeInfo,
  });

  static const double cardWidth = 300.0;
  static const double cardHeight = 350.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cardWidth,
      height: cardHeight,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.0),
        ),
        margin: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: cardWidth,
              height: cardHeight * 0.4,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(22.0),
                  topRight: Radius.circular(22.0),
                ),
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
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
          ],
        ),
      ),
    );
  }
}