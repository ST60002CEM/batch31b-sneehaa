import 'package:flutter/material.dart';

class PlaceCard extends StatelessWidget {
  final ImageProvider imageAsset;
  final String hotelName;
  final String location;
  final int rating;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  const PlaceCard({
    required this.imageAsset,
    required this.hotelName,
    required this.location,
    required this.rating,
    required this.isFavorite,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    const double cardMargin = 8.0;
    const double cardPadding = 16.0;
    const double imageHeight = 150.0;
    const double iconSize = 20.0;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: cardMargin, vertical: cardMargin),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 4.0,
      child: InkWell(
        onTap: () {
          // Handle card tap
        },
        child: Container(
          padding: const EdgeInsets.all(cardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: imageHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: imageAsset,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              Text(
                hotelName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8.0),
              Text(
                location,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: iconSize,
                  ),
                  const SizedBox(width: 4.0),
                  Text(rating.toString()),
                  const Spacer(),
                  IconButton(
                    icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                    onPressed: onFavoritePressed,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
