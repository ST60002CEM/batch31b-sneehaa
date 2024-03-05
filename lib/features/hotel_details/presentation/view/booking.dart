import 'package:bookaway/config/constants/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookingForm extends StatefulWidget {
  final String hotelId;

  const BookingForm({Key? key, required this.hotelId}) : super(key: key);

  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  late DateTime _checkInDate;
  late DateTime _checkOutDate;
  final TextEditingController _numberOfRoomsController = TextEditingController();
  final TextEditingController _numberOfAdultsController = TextEditingController();
  final TextEditingController _numberOfChildrenController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _checkInDate = DateTime.now();
    _checkOutDate = DateTime.now().add(Duration(days: 1));
  }

  @override
  void dispose() {
    _numberOfRoomsController.dispose();
    _numberOfAdultsController.dispose();
    _numberOfChildrenController.dispose();
    super.dispose();
  }

  Future<void> _bookHotel() async {
    final bookingData = {
      'hotelId': widget.hotelId,
      'numberOfRooms': _numberOfRoomsController.text,
      'numberOfAdults': _numberOfAdultsController.text,
      'numberOfChildren': _numberOfChildrenController.text,
      'checkInDate': _formatDate(_checkInDate),
      'checkOutDate': _formatDate(_checkOutDate),
    };

    const url = ApiEndpoints.baseUrl + ApiEndpoints.bookHotel;

    try {
      final response = await http.post(
        Uri.parse(url),
        body: bookingData,
      );

      if (response.statusCode == 200) {
        // Booking successful
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Booking Confirmation'),
              content: Text('Your booking has been confirmed.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        // Handle error
        print('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month}-${date.day}';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Book Now',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _numberOfRoomsController,
              decoration: InputDecoration(labelText: 'Number of Rooms'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _numberOfAdultsController,
              decoration: InputDecoration(labelText: 'Number of Adults'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _numberOfChildrenController,
              decoration: InputDecoration(labelText: 'Number of Children'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _bookHotel,
              child: Text('Book'),
            ),
          ],
        ),
      ),
    );
  }
}
