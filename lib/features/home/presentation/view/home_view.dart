import 'package:bookaway/features/hotel_details/presentation/view/hotel_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bookaway/features/hotel_details/domain/entity/hotel_details.dart';
import 'package:bookaway/features/home/presentation/view/booking_search.dart';
import 'package:bookaway/features/home/presentation/home_viewmodel/home_view_model.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(hotelViewModelProvider);
    final featuredHotels = viewModel.hotels
        .where((hotel) => hotel.hotelCategory == 'featured')
        .toList();
    final popularHotels = viewModel.hotels
        .where((hotel) => hotel.hotelCategory == 'popular')
        .toList();

    // Define the _performSearch function here
    void _performSearch(String location, DateTime checkInDate,
        DateTime checkOutDate, int adults, int children, int rooms) {}

    return Scaffold(
      appBar: AppBar(
        title: const Text('BookAway'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BookingSearchBar(
                    onSearch: _performSearch,
                  ),
                  if (featuredHotels.isNotEmpty) ...[
                    _buildCategoryHeader('Featured'),
                    _buildHotelList(context, featuredHotels.cast<HotelDetailsEntity>()),
                  ],
                  if (popularHotels.isNotEmpty) ...[
                    _buildCategoryHeader('Popular Destinations'),
                    _buildHotelList(context, popularHotels.cast<HotelDetailsEntity>()),
                  ],
                ],
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: const Color(0xFFFF6F6F),
        unselectedItemColor: const Color.fromARGB(255, 150, 150, 150),
        onTap: (index) {
          switch (index) {
            case 0:
              // Handle navigation to home page
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 1:
              // Handle navigation to favourites page
              Navigator.pushReplacementNamed(context, '/favourites');
              break;
            case 2:
              // Handle navigation to profile page
              Navigator.pushReplacementNamed(context, '/profile');
              break;
          }
        },
      ),
    );
  }

  Widget _buildCategoryHeader(String category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            category,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildHotelList(
      BuildContext context, List<HotelDetailsEntity> hotelDetails) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hotelDetails.length,
        itemBuilder: (context, index) {
          final hotel = hotelDetails[index];
          return InkWell(
            onTap: () {
              // Navigate to HotelDetailsPage and pass the selected hotel details
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                    HotelDetailsPage(hotelDetailsEntity: hotel),
                ),
              );
            },
            child: Container(
              width: 200,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        hotel.hotelImageUrl ?? '',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hotel.hotelName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          hotel.hotelDescription,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
