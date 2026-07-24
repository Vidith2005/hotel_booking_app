import 'package:flutter/material.dart';

import '../../../models/hotel.dart';

class BookingScreen extends StatefulWidget {
  final Hotel hotel;

  const BookingScreen({
    super.key,
    required this.hotel,
  });

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime? checkInDate;
  DateTime? checkOutDate;

  int guests = 1;

  Future<void> _selectCheckInDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        checkInDate = picked;
      });
    }
  }

  Future<void> _selectCheckOutDate() async {
    if (checkInDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select the check-in date first."),
        ),
      );
      return;
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: checkInDate!.add(const Duration(days: 1)),
      firstDate: checkInDate!.add(const Duration(days: 1)),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        checkOutDate = picked;
      });
    }
  }

  int get totalNights {
    if (checkInDate == null || checkOutDate == null) {
      return 0;
    }

    return checkOutDate!
        .difference(checkInDate!)
        .inDays;
  }

  int get totalPrice {
    return totalNights * widget.hotel.price;
  }

  void _confirmBooking() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Booking Confirmed 🎉"),
        content: Text(
          "Your booking for ${widget.hotel.name} has been confirmed.",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Back to hotel details
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book ${widget.hotel.name}"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select Check-in Date",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Card(
              child: ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text("Check-in"),
                subtitle: Text(
                  checkInDate == null
                      ? "Select a date"
                      : "${checkInDate!.day}/${checkInDate!.month}/${checkInDate!.year}",
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: _selectCheckInDate,
              ),
            ), //check-in card

            const SizedBox(height: 20),

            Card(
              child: ListTile(
                leading: const Icon(Icons.calendar_month),
                title: const Text("Check-out"),
                subtitle: Text(
                  checkOutDate == null
                      ? "Select a date"
                      : "${checkOutDate!.day}/${checkOutDate!.month}/${checkOutDate!.year}",
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: _selectCheckOutDate,
              ),
            ), //check-out card

            const SizedBox(height: 25),

            const Text(
              "Guests",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: guests > 1
                          ? () {
                        setState(() {
                          guests--;
                        });
                      }
                          : null,
                      icon: const Icon(Icons.remove_circle),
                    ),

                    Expanded(
                      child: Center(
                        child: Text(
                          "$guests Guest${guests > 1 ? "s" : ""}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        setState(() {
                          guests++;
                        });
                      },
                      icon: const Icon(Icons.add_circle),
                    ),
                  ],
                ),
              ),
            ), //guests selector card

            const SizedBox(height: 25),

            Card(
              color: Colors.indigo.shade50,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nights: $totalNights",
                      style: const TextStyle(fontSize: 18),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "Price per night: ₹${widget.hotel.price}",
                      style: const TextStyle(fontSize: 18),
                    ),

                    const Divider(),

                    Text(
                      "Total: ₹$totalPrice",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                  ],
                ),
              ),
            ), //total price card

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  if (checkInDate == null || checkOutDate == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please select both dates."),
                      ),
                    );
                    return;
                  }

                  _confirmBooking();
                },
                child: const Text(
                  "Confirm Booking",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}