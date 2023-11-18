import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderWidget extends StatelessWidget {
  final List<String> imageAssets = [
    'assets/images/offer1.jpg',
    'assets/images/offer2.jpg',
    'assets/images/offer3.jpg'
  ];

  final List<String> texts = [
    'Get 20% off your stay at beachfront resorts with code BEACH20.',
    'Enjoy 15% off central hotels using code CITY15.',
    'Book mountain cabins now and save 25% with code MOUNTAIN25.'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 300),
          child: Text(
            'Offers',
            style: TextStyle(
              fontFamily: 'Agbalumo',
              fontSize: 24.0,
            ),
          ),
        ),
        Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            child: CarouselSlider.builder(
              itemCount: imageAssets.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      image: DecorationImage(
                        image: AssetImage(imageAssets[index]),
                        fit: BoxFit.cover,
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color:
                              const Color.fromARGB(255, 71, 70, 70).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          texts[index],
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                height: 200.0,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                pauseAutoPlayOnTouch: true,
                aspectRatio: 16 / 9,
                onPageChanged: (index, reason) {},
              ),
            ))
      ],
    );
  }
}
