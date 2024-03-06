import 'dart:async';
import 'package:bookaway/features/home/domain/entity/home_entity.dart';
import 'package:bookaway/features/hotel_details/presentation/view/hotel_details_view.dart';
import 'package:flutter/material.dart';
import 'package:bookaway/features/hotel_details/domain/entity/hotel_details.dart';
import 'package:all_sensors2/all_sensors2.dart';

class HotelSearchBar extends StatefulWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onChanged;
  final List<HotelEntity> hotels;

  const HotelSearchBar({
    Key? key,
    required this.searchController,
    required this.onChanged,
    required this.hotels,
  }) : super(key: key);

  @override
  _HotelSearchBarState createState() => _HotelSearchBarState();
}

class _HotelSearchBarState extends State<HotelSearchBar> {
  List<double> _accelerometerValue = [];
  late StreamSubscription<dynamic> _streamSubscription;

  @override
  void initState() {
    super.initState();
    _streamSubscription = accelerometerEvents!.listen((event) {
      setState(() {
        _accelerometerValue = [event.x, event.y, event.z];
        if (_shouldPerformSearch()) {
          performSearch();
        }
      });
    });
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  bool _shouldPerformSearch() {
    return _accelerometerValue[0].abs() > 10 ||
        _accelerometerValue[1].abs() > 10 ||
        _accelerometerValue[2].abs() > 10;
  }

  void performSearch() {
    String searchText = widget.searchController.text;
    HotelEntity? selectedHotel;
    try {
      selectedHotel = widget.hotels.firstWhere(
        (hotel) => hotel.hotelName.toLowerCase() == searchText.toLowerCase(),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Hotel not found')),
      );
      return;
    }
    HotelDetailsEntity hotelDetailsEntity = HotelDetailsEntity(
      hotelId: selectedHotel!.hotelId ?? '',
      hotelName: selectedHotel.hotelName,
      hotelPrice: selectedHotel.hotelPrice,
      hotelDescription: selectedHotel.hotelDescription,
      hotelCategory: selectedHotel.hotelCategory,
      hotelImageUrl: selectedHotel.hotelImageUrl,
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            HotelDetailsPage(hotelDetailsEntity: hotelDetailsEntity),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: performSearch,
          ),
          Expanded(
            child: TextField(
              controller: widget.searchController,
              onChanged: widget.onChanged,
              decoration: const InputDecoration(
                hintText: 'Search for hotels',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
