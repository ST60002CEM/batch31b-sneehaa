import 'package:bookaway/widgets/featured_card.dart';
import 'package:flutter/material.dart';

class FeaturedDestinations extends StatelessWidget {
  final List<FeaturedInfo> featuredDestinations = [
    FeaturedInfo(
      imageAsset: const AssetImage('assets/images/featured1.jpg'),
      hotelName: 'The Nautilus',
      location: 'Maldives',
      rating: 3,
    ),
    FeaturedInfo(
      imageAsset: const AssetImage('assets/images/featured2.jpg'),
      hotelName: 'Hotel Giotto Assisi',
      location: 'Italy',
      rating: 2,
    ),
    FeaturedInfo(
      imageAsset: const AssetImage('assets/images/featured3.jpg'),
      hotelName: ' Hotel Scheiwzerhof Bern',
      location: 'Switzerland',
      rating: 1,
    ),
    FeaturedInfo(
      imageAsset: const AssetImage('assets/images/featured4.jpg'),
      hotelName: 'Viceroy Bali in Ubud',
      location: 'Indonesia',
      rating: 4,
    ),
    FeaturedInfo(
      imageAsset: const AssetImage('assets/images/featured5.jpg'),
      hotelName: 'Acqua Hotel Pattaya',
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
              'Featured Destinations',
              style: TextStyle(fontSize: 24.0, fontFamily: 'Agbalumo'),
            ),
          ),
          Container(
            height: 250.0,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: 16.0),
              scrollDirection: Axis.horizontal,
              itemCount: featuredDestinations.length,
              itemBuilder: (context, index) {
                final place = featuredDestinations[index];
                return FeatureCard(
                  featureInfo: place,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
