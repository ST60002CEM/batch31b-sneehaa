// import 'package:bookaway/config/constants/api_endpoints.dart';
// import 'package:bookaway/core/failure/failure.dart';
// import 'package:bookaway/features/bookings/data/model/booking_api_model.dart';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';

// class BookingRemoteDataSource {
//   final Dio dio;

//   BookingRemoteDataSource(this.dio);

//   Future<Either<Failure, List<BookingApiModel>>> getBookings(int page) async {
//     // Update the endpoint to get bookings
//     const String endpoint = ApiEndpoints.getBookings;

//     try {
//       Response response = await dio.get(endpoint, queryParameters: {
//         'page': page,
//       });

//       final List<dynamic> data = response.data["bookings"];
//       final bookings =
//           data.map((json) => BookingApiModel.fromJson(json)).toList();
//       return Right(bookings);
//     } on DioException catch (e) {
//       return Left(Failure(error: e.message.toString()));
//     }
//   }
// }
