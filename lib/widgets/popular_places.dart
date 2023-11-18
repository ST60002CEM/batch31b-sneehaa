import 'package:flutter/material.dart';

class PopularPlacesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Popular Places',
                  style: TextStyle(fontSize: 24.0, fontFamily: 'Agbalumo'),
                ),
              ),
            ),
            Container(
              height: 250.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  10,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 210.0,
                      height: 250.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              'assets/images/hotel1.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 8.0,
                            left: 8.0,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: 16.0,
                                ),
                                const SizedBox(width: 4.0),
                                Text(
                                  'Place $index',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
