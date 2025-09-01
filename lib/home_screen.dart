import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_smit/Login/Signup/login_screen.dart';
import 'package:hackathon_smit/cards_used_in/card_hospital.dart';
import 'package:hackathon_smit/screens/all_doctor_list.dart';
import 'package:hackathon_smit/screens/map_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // sign out function
  void _signOut() async {
    await FirebaseAuth.instance.signOut();
    if (mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (Route<dynamic> route) => false,
      );
    }
  }

  // Different screens for bottom navigation
  Widget _getSelectedScreen() {
    switch (_selectedIndex) {
      case 0:
        // return AllDoctorList();
        return _buildHomeScreen();
      case 1:
        return MapScreen();
      case 2:
        return _calenderpage();
      case 3:
        return _buildProfileScreen();
      default:
        return _buildHomeScreen();
    }
  }

  Widget _buildHomeScreen() {
    final user = FirebaseAuth.instance.currentUser;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Location Header
            const Text(
              "Location",
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.location_on, size: 15),
                    SizedBox(width: 4),
                    Text(
                      "Seattle, USA ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down_rounded, size: 17),
                  ],
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 224, 221, 221),
                  ),
                  child: const Icon(
                    Icons.notifications_outlined,
                    size: 19,
                    color: Color.fromARGB(255, 48, 47, 47),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Search Bar
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Search doctor...',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Specialist Doctors Slide
            _buildSpecialistDoctorsSlide(),

            const SizedBox(height: 10),

            // Categories Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AllDoctorList()),
                    );
                  },
                  child: const Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w100,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),

            // Categories Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              crossAxisSpacing: 17,
              mainAxisSpacing: 16,
              children: [
                _buildCategoryItem(
                  "assets/images/teeth.png",
                  'Dentistry',
                  Color(0xffd99398),
                ),
                _buildCategoryItem(
                  "assets/images/cardio.png",
                  'Cardio..',
                  Color(0xff94c39f),
                ),
                _buildCategoryItem(
                  "assets/images/pulmono.png",
                  'Pulmono..',
                  Color(0xfff0af80),
                ),
                _buildCategoryItem(
                  "assets/images/general.png",
                  'General',
                  Color(0xffae9ecc),
                ),
                _buildCategoryItem(
                  "assets/images/neurology.png",
                  'Neurology',
                  Color(0xff539c91),
                ),
                _buildCategoryItem(
                  "assets/images/gastroen.png",
                  'Gastroen..',
                  Color(0xff391b60),
                ),
                _buildCategoryItem(
                  "assets/images/laboratory.png",
                  'Laborator..',
                  Color(0xffdcb6b5),
                ),
                _buildCategoryItem(
                  "assets/images/vaccinate.png",
                  'Vaccinat..',
                  Color(0xff90cbda),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Nearby Medical Centers',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w100,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            ClinicsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecialistDoctorsSlide() {
    return Container(
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF4A9B8E), Color(0xFF6FB3A8)],
        ),
      ),
      child: Stack(
        children: [
          // Content on the left
          Positioned(
            left: 20,
            top: 20,
            bottom: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Looking for\nSpecialist Doctors?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Schedule an appointment with\nour top doctors.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    height: 1.3,
                  ),
                ),
                const Spacer(),
                // Page indicators
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      width: 3,
                      height: 3,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      width: 3,
                      height: 3,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Doctor image on the right
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              child: Container(
                width: 120,
                child: Image.asset(
                  "assets/images/girl.png",
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.teal[300]!, Colors.teal[400]!],
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.local_hospital,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String imagePath, String label, Color backcolor) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: backcolor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              imagePath,
              width: 30,
              height: 30,
              // color: color,
              errorBuilder: (context, error, stackTrace) {
                // Fallback to icon if image not found
                return Icon(Icons.medical_services, size: 25);
              },
            ),
          ),
        ),
        const SizedBox(height: 3),
        Text(
          label,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _calenderpage() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.model_training, size: 80, color: Colors.blue),
          SizedBox(height: 20),
          Text(
            'Calender',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Medical training and courses',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileScreen() {
    final user = FirebaseAuth.instance.currentUser;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blue[100],
            child: const Icon(Icons.person, size: 60, color: Colors.blue),
          ),
          const SizedBox(height: 20),
          Text(
            user?.email ?? 'Guest User',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Profile Settings',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: _signOut,
            icon: const Icon(Icons.logout),
            label: const Text('Sign Out'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getSelectedScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 31, 34, 36),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_rounded),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person_outlined), label: ''),
        ],
      ),
    );
  }
}
