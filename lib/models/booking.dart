import 'hotel.dart';

class Booking {
  final Hotel hotel;
  final DateTime checkIn;
  final DateTime checkOut;
  final int guests;
  final int totalPrice;

  Booking({
    required this.hotel,
    required this.checkIn,
    required this.checkOut,
    required this.guests,
    required this.totalPrice,
  });
}