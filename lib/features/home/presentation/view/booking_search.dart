import 'package:bookaway/features/hotel_details/domain/entity/hotel_details.dart';
import 'package:flutter/material.dart';
import 'package:bookaway/features/home/domain/entity/home_entity.dart';
import 'package:bookaway/features/hotel_details/presentation/view/hotel_details_view.dart';

class HotelSearchBar extends StatelessWidget {
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
            onPressed: () {
              String searchText = searchController.text;
              HotelEntity? selectedHotel;
              try {
                selectedHotel = hotels.firstWhere(
                  (hotel) =>
                      hotel.hotelName.toLowerCase() == searchText.toLowerCase(),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Hotel not found')),
                );
                return;
              }
              HotelDetailsEntity hotelDetailsEntity = HotelDetailsEntity(
                hotelId: selectedHotel.hotelId ?? '',
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
            },
          ),
          Expanded(
            child: TextField(
              controller: searchController,
              onChanged: onChanged,
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
