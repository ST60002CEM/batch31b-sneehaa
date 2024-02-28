
import 'package:bookaway/features/home/presentation/home_viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
  

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
  
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(hotelViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'BookAway',
          style: TextStyle(color: Color(0xFFFF8B8B)),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {},
          ),
        ],
      ),
      body: viewModel.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: viewModel.hotels.length,
              itemBuilder: (context, index) {
                final hotel = viewModel.hotels[index];
                return ListTile(
                  title: Text(hotel.hotelName),
                  subtitle: Text(hotel.hotelDescription),
                  // Add more details if needed
                );
              },
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
        currentIndex: 0, // Set the current index based on your logic
        selectedItemColor: const Color(0xFFFF6F6F),
        unselectedItemColor: Color.fromARGB(255, 150, 150, 150),
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}