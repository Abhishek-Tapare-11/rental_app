import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 247, 250, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        title: Text(
          "Profile",
          style: GoogleFonts.workSans(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: const Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  const BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.05),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 45,
                    child: Icon(Icons.person, size: 40, color: Colors.black),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Abhishek Tapare",
                    style: GoogleFonts.workSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "abh**********11@gmail.com",
                    style: GoogleFonts.workSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(158, 158, 158, 1),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(45, 156, 219, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    icon: const Icon(Icons.edit, size: 18, color: Colors.white),
                    label: const Text(
                      "Edit Profile",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    "Active Orders",
                    "3",
                    const Color.fromRGBO(33, 150, 243, 1),
                  ),
                ),
                Expanded(
                  child: _buildStatCard(
                    "Past Orders",
                    "1",
                    const Color.fromRGBO(76, 175, 80, 1),
                  ),
                ),
                Expanded(
                  child: _buildStatCard(
                    "Wishlist",
                    "5",
                    const Color.fromRGBO(255, 152, 0, 1),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Options List
            _buildOptionTile(Icons.shopping_bag_outlined, "My Orders"),
            _buildOptionTile(Icons.favorite_border, "Wishlist"),
            _buildOptionTile(Icons.notifications_none, "Notifications"),
            _buildOptionTile(Icons.settings_outlined, "Settings"),
            _buildOptionTile(Icons.help_outline, "Help Center"),
            _buildOptionTile(Icons.logout, "Logout", isLogout: true),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Container(
      height: 110,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: GoogleFonts.workSans(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: GoogleFonts.workSans(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(33, 33, 33, 1),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildOptionTile(
    IconData icon,
    String title, {
    bool isLogout = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isLogout
              ? const Color.fromRGBO(244, 67, 54, 1)
              : const Color.fromRGBO(45, 156, 219, 1),
        ),
        title: Text(
          title,
          style: GoogleFonts.workSans(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isLogout
                ? const Color.fromRGBO(244, 67, 54, 1)
                : const Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Color.fromRGBO(97, 97, 97, 1),
        ),
        onTap: () {},
      ),
    );
  }
}
