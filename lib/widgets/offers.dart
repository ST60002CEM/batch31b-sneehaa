import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class OfferPlaces extends StatelessWidget {
  final List<String> offerImages = [
    'assets/images/offer1.jpg',
    'assets/images/offer2.jpg',
    'assets/images/offer3.jpg',
  ];

  final List<String> offerTexts = [
    'Discover Exciting Places',
    'Special Discounts for You',
    'Explore Beautiful Destinations',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.8,
          ),
          items: offerImages.asMap().entries.map((entry) {
            int index = entry.key;
            String image = entry.value;
            String text = offerTexts[index];

            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 100.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          text,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
