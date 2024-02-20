import 'package:flutter/material.dart';

class Hotel {
  final String hotelName;

  Hotel(this.hotelName);
}

class BookingPaginationScreen extends StatefulWidget {
  @override
  _BookingPaginationScreenState createState() =>
      _BookingPaginationScreenState();
}

class _BookingPaginationScreenState extends State<BookingPaginationScreen> {
  final ScrollController _scrollController = ScrollController();
  List<Hotel> hotelList = [];
  bool isLoading = false;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    loadInitialData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _refreshData() async {
    hotelList.clear();
    loadInitialData();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (!isLoading) {
        setState(() {
          isLoading = true;
        });

        Future.delayed(const Duration(seconds: 2), () {
          loadMoreData();
          setState(() {
            isLoading = false;
          });
        });
      }
    }
  }

  void loadInitialData() {
    hotelList.addAll([
      Hotel('Hotel ABC'),
      Hotel('Luxury Resort'),
      Hotel('City View Inn'),
      Hotel('Seaside Retreat'),
      Hotel('Mountain Lodge'),
      Hotel('Elegant Palace Hotel'),
      Hotel('Sunrise Suites'),
      Hotel('Royal Gardens Resort'),
      Hotel('Tranquil Haven Hotel'),
      Hotel('Grand Plaza Inn'),
      Hotel('Harbor Lights Hotel'),
      Hotel('Majestic View Hotel'),
      Hotel('Palm Oasis Resort'),
      Hotel('Golden Gate Hotel'),
      Hotel('Skyline Towers'),
      Hotel('Serenity Suites'),
      Hotel('Ocean Breeze Inn'),
      Hotel('Downtown Oasis Hotel'),
      Hotel('Central Park Lodge'),
      Hotel('Sunset Bliss Resort'),
    ]);

    setState(() {});
  }

  void loadMoreData() {
    for (int i = 0; i < 5; i++) {
      Hotel repeatedHotel = hotelList[currentIndex % 20];
      hotelList.add(Hotel('New Hotel ${hotelList.length + 1}'));
      currentIndex++;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotels'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: hotelList.length + 1,
          itemBuilder: (context, index) {
            if (index < hotelList.length) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: HotelCard(hotel: hotelList[index]),
              );
            } else {
              return isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container();
            }
          },
        ),
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final Hotel hotel;

  const HotelCard({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        title: Text(hotel.hotelName),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BookingPaginationScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
