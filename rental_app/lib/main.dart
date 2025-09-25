import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_app/provider/rental_provider.dart';
import 'package:rental_app/view/bottomnavigator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => RentalProvider())],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavigator(),
      ),
    );
  }
}
