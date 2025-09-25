import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rental_app/provider/rental_provider.dart';
import 'orders.dart';

class ProductsDetails extends StatefulWidget {
  final Map<String, String> product;

  const ProductsDetails({super.key, required this.product});

  @override
  State<ProductsDetails> createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  String selectedDuration = "Monthly";

  @override
  Widget build(BuildContext context) {
    final rentalProvider = Provider.of<RentalProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Product Details",
          style: GoogleFonts.workSans(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        actions: [Image.asset("assets/img/share.png")],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 240,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Hero(
                    tag: widget.product["image1"]!,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          widget.product["image1"]!,
                          height: 240,
                          width: 240,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  if (widget.product["image2"]!.isNotEmpty)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        widget.product["image2"]!,
                        height: 240,
                        width: 240,
                        fit: BoxFit.cover,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  // Name
                  Text(
                    widget.product["name"]!,
                    style: GoogleFonts.workSans(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(18, 23, 23, 1),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Description
                  Text(
                    widget.product["description"]!,
                    style: GoogleFonts.workSans(
                      fontSize: 16,
                      color: Color.fromRGBO(18, 23, 23, 1),
                    ),
                  ),
                  const SizedBox(height: 16),

                  Text(
                    "Details",
                    style: GoogleFonts.workSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(18, 23, 23, 1),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IntrinsicWidth(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(thickness: 1),
                            const SizedBox(height: 8),

                            Text(
                              "Material",
                              style: GoogleFonts.workSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: const Color.fromRGBO(97, 125, 138, 1),
                              ),
                            ),
                            Text(
                              "Fabric",
                              style: GoogleFonts.workSans(
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(18, 23, 23, 1),
                              ),
                            ),

                            const SizedBox(height: 16),

                            Divider(thickness: 1),
                            const SizedBox(height: 8),

                            Text(
                              "Color",
                              style: GoogleFonts.workSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: const Color.fromRGBO(97, 125, 138, 1),
                              ),
                            ),
                            Text(
                              "Grey",
                              style: GoogleFonts.workSans(
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(18, 23, 23, 1),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 24),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(thickness: 1),
                            const SizedBox(height: 8),

                            Text(
                              "Dimensions",
                              style: GoogleFonts.workSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: const Color.fromRGBO(97, 125, 138, 1),
                              ),
                            ),
                            Text(
                              "84\"W x 36\"D x 32\"H",
                              style: GoogleFonts.workSans(
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(18, 23, 23, 1),
                              ),
                            ),

                            const SizedBox(height: 16),

                            Divider(thickness: 1),
                            const SizedBox(height: 8),

                            Text(
                              "Condition",
                              style: GoogleFonts.workSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: const Color.fromRGBO(97, 125, 138, 1),
                              ),
                            ),
                            Text(
                              "New",
                              style: GoogleFonts.workSans(
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(18, 23, 23, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(240, 242, 245, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: ["Daily", "Weekly", "Monthly"].map((duration) {
                        final isSelected = selectedDuration == duration;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDuration = duration;
                            });
                          },
                          child: Container(
                            width: 111,
                            height: 37,
                            margin: EdgeInsets.only(right: 8),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.white
                                  : Color.fromRGBO(240, 242, 245, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              duration,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.workSans(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: isSelected
                                    ? Colors.black
                                    : Color.fromRGBO(97, 125, 138, 1),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  Text(
                    "Related Products",
                    style: GoogleFonts.workSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),

            SizedBox(
              height: 211,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 12),
                scrollDirection: Axis.horizontal,
                itemCount: rentalProvider.relatedProducts.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 160,
                    height: 221,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            rentalProvider.relatedProducts[index]["image"]!,
                            height: 160,
                            width: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          rentalProvider.relatedProducts[index]["name"]!,
                          style: GoogleFonts.workSans(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color.fromRGBO(18, 23, 23, 1),
                          ),
                        ),
                        Text(
                          rentalProvider.relatedProducts[index]["price"]!,
                          style: GoogleFonts.workSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color.fromRGBO(97, 125, 138, 1),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 140,
                      height: 48,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(240, 242, 245, 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          "\$150/month",
                          style: GoogleFonts.workSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      Orders.dummyOrders.add({
                        "name": widget.product["name"] ?? "",
                        "orderId":
                            "#ORD${DateTime.now().millisecondsSinceEpoch}",
                        "status": "Pending",
                        "image": widget.product["image1"] ?? "",
                        "totalPrice": "150",
                        "processingDate": "",
                        "acceptedDate": "",
                        "packedDate": "",
                        "completedDate": "",
                      });
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${widget.product["name"]} booked!"),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    child: Container(
                      height: 48,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromRGBO(18, 148, 212, 1),
                      ),
                      child: Center(
                        child: Text(
                          "Book Now",
                          style: GoogleFonts.workSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
