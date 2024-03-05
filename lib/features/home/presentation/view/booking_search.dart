import 'package:bookaway/features/hotel_details/domain/entity/hotel_details.dart';
import 'package:flutter/material.dart';
import 'package:bookaway/features/home/domain/entity/home_entity.dart'; // Import your hotel entity class
import 'package:bookaway/features/hotel_details/presentation/view/hotel_details_view.dart'; // Import your HotelDetailsPage

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
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(Icons.search),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: searchController,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: 'Search for hotels',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              String searchText = searchController.text;
              // Find the hotel corresponding to the search query
              HotelEntity? selectedHotel;
              try {
                selectedHotel = hotels.firstWhere(
                  (hotel) =>
                      hotel.hotelName.toLowerCase() == searchText.toLowerCase(),
                );
              } catch (e) {
                // Handle the case where no hotel is found
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Hotel not found')),
                );
                return; // Return to exit the onPressed callback
              }
              if (selectedHotel != null) {
                // Convert HotelEntity to HotelDetailsEntity
                HotelDetailsEntity hotelDetailsEntity = HotelDetailsEntity(
                  hotelId: selectedHotel.hotelId ?? '',
                  hotelName: selectedHotel.hotelName,
                  hotelPrice: selectedHotel.hotelPrice,
                  hotelDescription: selectedHotel.hotelDescription,
                  hotelCategory: selectedHotel.hotelCategory,
                  hotelImageUrl: selectedHotel.hotelImageUrl,
                );
                // Navigate to HotelDetailsPage with the selected hotel details
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HotelDetailsPage(
                        hotelDetailsEntity: hotelDetailsEntity),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
