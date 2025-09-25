import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rental_app/provider/rental_provider.dart';
import 'package:rental_app/view/productdetails.dart';
import 'package:rental_app/view/widgets/itemcard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> categories = [
    "All",
    "Electronics",
    "Home Goods",
    "Sports",
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RentalProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Home",
          style: GoogleFonts.workSans(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Color.fromRGBO(18, 23, 23, 1),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search for items",
                  hintStyle: GoogleFonts.workSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: const Color.fromRGBO(240, 242, 245, 1),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // Categories
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(240, 242, 245, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      category,
                      style: GoogleFonts.workSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(18, 23, 23, 1),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            // Featured Items
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Featured Items",
                style: GoogleFonts.workSans(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(18, 23, 23, 1),
                ),
              ),
            ),
            SizedBox(
              height: 339,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: provider.featuredItems.length,
                itemBuilder: (context, index) {
                  final item = provider.featuredItems[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  ProductsDetails(product: item),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                                const begin = Offset(0.0, 1.0);
                                const end = Offset.zero;
                                const curve = Curves.ease;

                                final tween = Tween(
                                  begin: begin,
                                  end: end,
                                ).chain(CurveTween(curve: curve));
                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  ),
                                );
                              },
                        ),
                      );
                    },
                    child: buildItemCard(
                      item["image1"]!,
                      item["name"]!,
                      item["description"]!,
                      imageHeight: 240,
                      imageWidth: 240,
                    ),
                  );
                },
              ),
            ),

            // Popular Rentals
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Popular Rentals",
                style: GoogleFonts.workSans(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(18, 23, 23, 1),
                ),
              ),
            ),
            Wrap(
              runSpacing: 8,
              children: List.generate(provider.popularRentals.length, (index) {
                double width = MediaQuery.of(context).size.width / 2;
                final item = provider.popularRentals[index];
                return SizedBox(
                  width: width,
                  child: buildItemCard(
                    item["image"]!,
                    item["name"]!,
                    item["description"]!,
                    imageHeight: 173,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
