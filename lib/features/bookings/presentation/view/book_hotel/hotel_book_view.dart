import 'package:bookaway/features/bookings/domain/entity/booking_entity.dart';
import 'package:bookaway/features/bookings/presentation/view_model/booking_view_model.dart';
import 'package:bookaway/features/hotel_details/domain/entity/hotel_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookHotelPage extends ConsumerStatefulWidget {
  final HotelDetailsEntity hotelDetailsEntity;
  final String hotelId;

  const BookHotelPage({
    Key? key,
    required this.hotelDetailsEntity,
    required this.hotelId,
  }) : super(key: key);

  @override
  _BookHotelPageState createState() => _BookHotelPageState();
}

class _BookHotelPageState extends ConsumerState<BookHotelPage> {
  final TextEditingController _checkInDateController = TextEditingController();
  final TextEditingController _checkOutDateController = TextEditingController();
  final TextEditingController _adultController = TextEditingController();
  final TextEditingController _childrenController = TextEditingController();
  final TextEditingController _roomsController = TextEditingController();

  void _bookHotel(String hotelId) {
    int adults = int.tryParse(_adultController.text) ?? 0;
    int children = int.tryParse(_childrenController.text) ?? 0;
    int rooms = int.tryParse(_roomsController.text) ?? 0;

    final entity = HotelBookingEntity(
      hotelId: hotelId,
      checkInDate: _checkInDateController.text,
      checkOutDate: _checkOutDateController.text,
      adults: adults,
      children: children,
      rooms: rooms,
    );

    ref
        .read(hotelBookingViewModelProvider.notifier)
        .bookHotelBooking(entity, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Hotel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _checkInDateController,
              decoration: const InputDecoration(
                labelText: 'Check-in Date',
              ),
            ),
            TextFormField(
              controller: _checkOutDateController,
              decoration: const InputDecoration(
                labelText: 'Check-out Date',
              ),
            ),
            TextFormField(
              controller: _adultController,
              decoration: const InputDecoration(
                labelText: 'Adults',
              ),
            ),
            TextFormField(
              controller: _childrenController,
              decoration: const InputDecoration(
                labelText: 'Children',
              ),
            ),
            TextFormField(
              controller: _roomsController,
              decoration: const InputDecoration(
                labelText: 'Rooms',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _bookHotel(widget.hotelId);
              },
              child: const Text(
                'Book Now',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
