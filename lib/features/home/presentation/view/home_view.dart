import 'package:bookaway/features/home/presentation/view/booking_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bookaway/features/home/domain/entity/home_entity.dart';
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
                    _buildHotelList(featuredHotels),
                  ],
                  if (popularHotels.isNotEmpty) ...[
                    _buildCategoryHeader('Popular Destinations'),
                    _buildHotelList(popularHotels),
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
            icon: Icon(Icons.hotel),
            label: 'Hotels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online),
            label: 'My Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: const Color(0xFFFF6F6F),
        unselectedItemColor: Color.fromARGB(255, 150, 150, 150),
        onTap: (index) {
          // Handle navigation
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

  Widget _buildHotelList(List<HotelEntity> hotels) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          final hotel = hotels[index];
          return InkWell(
            onTap: () {
              // Handle hotel tap
            },
            child: Container(
              width: 200,
              margin: EdgeInsets.all(8),
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
