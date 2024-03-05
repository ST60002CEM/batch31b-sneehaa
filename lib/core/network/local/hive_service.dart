import 'package:bookaway/config/constants/hive_table_constants.dart';
import 'package:bookaway/features/home/data/model/home_hive_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

final hiveServiceProvider = Provider<HiveService>((ref) => HiveService());

class HiveService {
  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    // Add dummy data
    await addDummyHotels();
  }

  Future<List<HotelHiveModel>> getAllHotels() async {
    var box = await Hive.openBox<HotelHiveModel>(HiveTableConstant.hotelBox);
    var hotels = box.values.toList();
    box.close();
    return hotels;
  }

  Future<List<HotelHiveModel>> searchHotels(String query) async {
  var box = await Hive.openBox<HotelHiveModel>(HiveTableConstant.hotelBox);
  
  // Filter hotels based on the search query
  var hotels = box.values.where((hotel) => hotel.hotelName.toLowerCase().contains(query.toLowerCase())).toList();

  box.close();
  return hotels;
}


  // ======================== Insert Dummy Data ========================
  Future<void> addDummyHotels() async {
    // Check if the hotel box is empty
    var box = await Hive.openBox<HotelHiveModel>(HiveTableConstant.hotelBox);
    if (box.isEmpty) {
      final hotel1 = HotelHiveModel(
        hotelName: 'Hotel A',
        hotelPrice: 100,
        hotelDescription: "perfect",
        hotelCategory: "featured",
      );
      final hotel2 = HotelHiveModel(
        hotelName: 'Hotel B',
        hotelPrice: 120,
        hotelDescription: "luxury",
        hotelCategory: "deluxe",
      );
      final hotel3 = HotelHiveModel(
        hotelName: 'Hotel C',
        hotelPrice: 80,
        hotelDescription: "cozy",
        hotelCategory: "standard",
      );
      final hotel4 = HotelHiveModel(
        hotelName: 'Hotel D',
        hotelPrice: 150,
        hotelDescription: "seaside",
        hotelCategory: "resort",
      );

      List<HotelHiveModel> hotels = [hotel1, hotel2, hotel3, hotel4];

      // Insert hotels
      for (var hotel in hotels) {
        await addHotel(hotel);
      }
    }
  }

  // Add a single hotel
  Future<void> addHotel(HotelHiveModel hotel) async {
    var box = await Hive.openBox<HotelHiveModel>(HiveTableConstant.hotelBox);
    await box.add(hotel);
  }

  // ======================== Delete All Data ========================
  Future<void> deleteAllData() async {
    var box = await Hive.openBox<HotelHiveModel>(HiveTableConstant.hotelBox);
    await box.clear();
  }

  // ======================== Close Hive ========================
  Future<void> closeHive() async {
    await Hive.close();
  }

  // ======================== Delete Hive ========================
  Future<void> deleteHive() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    await Hive.deleteBoxFromDisk(HiveTableConstant.hotelBox);
    await Hive.deleteFromDisk();
  }
}
