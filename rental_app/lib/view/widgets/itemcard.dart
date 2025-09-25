import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildItemCard(
  String imagePath,
  String name,
  String description, {
  double imageHeight = 240,
  double imageWidth = 240,
}) {
  return Container(
    width: 240,
    padding: const EdgeInsets.all(12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image
        Hero(
          tag: imagePath,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              height: imageHeight,
              width: imageWidth,
              fit: BoxFit.cover,
            ),
          ),
        ),

        const SizedBox(height: 8),

        // Name
        Text(
          name,
          style: GoogleFonts.workSans(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(18, 23, 23, 1),
          ),
        ),

        const SizedBox(height: 4),

        // Description
        Text(
          description,
          style: GoogleFonts.workSans(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(97, 125, 138, 1),
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}
