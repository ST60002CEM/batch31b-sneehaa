import 'package:flutter/material.dart';
import 'package:bookaway/widgets/place_card.dart';

class PopularPlacesWidget extends StatelessWidget {
  final List<PlaceCard> popularPlaces = [
    PlaceCard(
      imageAsset: const AssetImage('assets/images/hotel1.jpg'),
      hotelName: 'Cappadocia',
      location: 'Turkey',
      rating: 3,
      isFavorite: true,
      onFavoritePressed: () {},
    ),
    PlaceCard(
      imageAsset: const AssetImage('assets/images/hotel2.jpg'),
      hotelName: 'Cappadocia',
      location: 'Turkey',
      rating: 3,
      isFavorite: true,
      onFavoritePressed: () {},
    ),
    PlaceCard(
      imageAsset: const AssetImage('assets/images/hotel3.jpg'),
      hotelName: 'Cappadocia',
      location: 'Turkey',
      rating: 3,
      isFavorite: true,
      onFavoritePressed: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Popular Places',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 250.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: popularPlaces.length,
            itemBuilder: (context, index) {
              final place = popularPlaces[index];
              return PlaceCard(
                imageAsset: place.imageAsset,
                hotelName: place.hotelName,
                location: place.location,
                rating: place.rating,
                isFavorite: true,
                onFavoritePressed: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
