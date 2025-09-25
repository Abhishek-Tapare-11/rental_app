import 'package:flutter/material.dart';

class RentalProvider extends ChangeNotifier {
  // Featured Items
  final List<Map<String, String>> _featuredItems = [
    {
      "image1": "assets/img/smart_kitchen.png",
      "image2": "",
      "name": "Smart Kitchen Set",
      "description": "Upgrade your cooking experience",
    },
    {
      "image1": "assets/img/tech_bundle.png",
      "image2": "",
      "name": "Tech Bundle",
      "description": "Latest gadgets for tech enthusiasts",
    },
    {
      "image1": "assets/img/sofa1.png",
      "image2": "assets/img/sofa2.png",
      "name": "Modern Sofa",
      "description":
          "This stylish sofa is perfect for any modern living room. It features a sleek design, comfortable cushions, and durable fabric. Available in various colors.",
    },
  ];

  // Popular Rentals
  final List<Map<String, String>> _popularRentals = [
    {
      "image": "assets/img/drone.png",
      "name": "DJI Drone",
      "description": "Capture stunning aerial footage",
    },
    {
      "image": "assets/img/camera.png",
      "name": "Canon Camera",
      "description": "Professional photography equipment",
    },
    {
      "image": "assets/img/headphone.png",
      "name": "Bose Headphones",
      "description": "Immersive audio experience",
    },
  ];

  // Related Products
  final List<Map<String, String>> _relatedProducts = [
    {
      "image": "assets/img/armchair.png",
      "name": "Armchair",
      "price": "\$50/month",
    },
    {
      "image": "assets/img/table.png",
      "name": "Coffee Table",
      "price": "\$30/month",
    },
    {"image": "assets/img/rug.png", "name": "Rug", "price": "\$20/month"},
  ];

  // Orders
  final List<Map<String, String>> _activeOrders = [];
  final List<Map<String, String>> _pastOrders = [];

  // Getters
  List<Map<String, String>> get featuredItems => _featuredItems;
  List<Map<String, String>> get popularRentals => _popularRentals;
  List<Map<String, String>> get relatedProducts => _relatedProducts;
  List<Map<String, String>> get activeOrders => _activeOrders;
  List<Map<String, String>> get pastOrders => _pastOrders;

  // Add a new dummy order
  void addOrder(Map<String, String> item) {
    final orderId = "#ORD${DateTime.now().millisecondsSinceEpoch}";
    final order = {
      "name": item["name"] ?? "",
      "orderId": orderId,
      "status": "Pending",
      "image": item["image1"] ?? item["image"] ?? "",
      "totalPrice": item["price"] ?? "100",
      "notes": "",
      "placedDate":
          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
      "acceptedDate": "",
      "packedDate": "",
      "completedDate": "",
    };

    _activeOrders.add(order);
    notifyListeners();
  }

  // Move order to pastOrders when completed
  void completeOrder(String orderId) {
    final index = _activeOrders.indexWhere((o) => o["orderId"] == orderId);
    if (index != -1) {
      final order = _activeOrders.removeAt(index);
      order["status"] = "Delivered";
      order["completedDate"] =
          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";
      _pastOrders.add(order);
      notifyListeners();
    }
  }
}
