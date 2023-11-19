import 'package:flutter/material.dart';
import 'package:bookaway/widgets/place_card.dart';

class PopularPlacesWidget extends StatelessWidget {
  final List<PlaceInfo> popularPlaces = [
    PlaceInfo(
      imageAsset: const AssetImage('assets/images/hotel1.jpg'),
      hotelName: 'Cappadocia Caves Hotel',
      location: 'Turkey',
      rating: 3,
    ),
    PlaceInfo(
      imageAsset: const AssetImage('assets/images/hotel2.jpg'),
      hotelName: 'Hôtel de Paris Opéra',
      location: 'Paris',
      rating: 2,
    ),
    PlaceInfo(
      imageAsset: const AssetImage('assets/images/hotel1.jpg'),
      hotelName: 'Emirates Grand Hotel',
      location: 'Dubai',
      rating: 1,
    ),
    PlaceInfo(
      imageAsset: const AssetImage('assets/images/hotel2.jpg'),
      hotelName: 'Cappadocia Caves Hotel',
      location: 'Turkey',
      rating: 4,
    ),
    PlaceInfo(
      imageAsset: const AssetImage('assets/images/hotel3.jpg'),
      hotelName: 'Hôtel de Paris Opéra',
      location: 'Paris',
      rating: 3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Popular Places',
              style: TextStyle(fontSize: 24.0, fontFamily: 'Agbalumo'),
            ),
          ),
          Container(
            height: 250.0,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: 16.0),
              scrollDirection: Axis.horizontal,
              itemCount: popularPlaces.length,
              itemBuilder: (context, index) {
                final place = popularPlaces[index];
                return PlaceCard(
                  placeInfo: place,
                  // isFavorite: true,
                  // onFavoritePressed: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
