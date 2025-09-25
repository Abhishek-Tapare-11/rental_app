import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rental_app/view/ordertracking.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  static List<Map<String, String?>> dummyOrders = [
    {
      "name": "Modern Appartment",
      "orderId": "#ORD12345",
      "status": "Pending",
      "image": "assets/img/apartment1.png",
      "totalPrice": "150",
      "processingDate": "",
      "acceptedDate": "",
      "packedDate": "",
      "completedDate": "",
    },
    {
      "name": "Modern Apartment",
      "orderId": "#ORD78901",
      "status": "Ongoing",
      "image": "assets/img/apartment2.png",
      "totalPrice": "200",
      "processingDate": "Order placed on 2025-09-25",
      "acceptedDate": "Order accepted on 2025-09-26",
      "packedDate": "",
      "completedDate": "",
    },
    {
      "name": "Mountain Bike",
      "orderId": "123456",
      "status": "Delivered",
      "image": "assets/img/bike.png",
      "totalPrice": "250",
      "processingDate": "Order placed on 07/20/2024",
      "acceptedDate": "Order accepted on 07/21/2024",
      "packedDate": "Order packed on 07/23/2024",
      "completedDate": "Order completed on 07/23/2024",
    },
  ];

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  bool showActive = true;

  @override
  Widget build(BuildContext context) {
    final orders = showActive
        ? Orders.dummyOrders.where((o) => o['status'] != 'Delivered').toList()
        : Orders.dummyOrders.where((o) => o['status'] == 'Delivered').toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Orders",
          style: GoogleFonts.workSans(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => showActive = true),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        "Active Orders",
                        style: GoogleFonts.workSans(
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(18, 23, 23, 1),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Stack(
                        children: [
                          Container(height: 5, color: Colors.grey[300]),
                          if (showActive)
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 3,
                                width: 100,
                                color: const Color.fromRGBO(18, 23, 23, 1),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => showActive = false),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        "Past Orders",
                        style: GoogleFonts.workSans(
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(18, 23, 23, 1),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Stack(
                        children: [
                          Container(height: 5, color: Colors.grey[300]),
                          if (!showActive)
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 3,
                                width: 80,
                                color: const Color.fromRGBO(18, 23, 23, 1),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          Expanded(
            child: orders.isEmpty
                ? Center(
                    child: Text(
                      "No orders found",
                      style: GoogleFonts.workSans(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      final order = orders[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  OrderTrackingPage(order: order),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${order["status"]}",
                                      style: const TextStyle(
                                        color: Color.fromRGBO(97, 125, 138, 1),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      order["name"]!,
                                      style: GoogleFonts.workSans(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "Order ID: ${order["orderId"]}",
                                      style: const TextStyle(
                                        color: Color.fromRGBO(97, 125, 138, 1),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Hero(
                                tag: order["orderId"]!,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    order["image"]!,
                                    height: 70,
                                    width: 130,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
