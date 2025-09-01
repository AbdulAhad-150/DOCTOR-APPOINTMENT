import 'package:flutter/material.dart';
import 'package:hackathon_smit/cards_used_in/map_screen_card.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final List<Hospital> hospitals = [
    Hospital(
      imagePath: "assets/images/hospital.jpg",
      title: "Sunrise Health Clinic",
      address: "123 Oak Street, CA 98765",
      rating: 5.0,
      reviews: 58,
      distance: "2.5 km / 40 min",
      category: "Hospital",
    ),
    Hospital(
      imagePath: "assets/images/hospital2.jpg",
      title: "Green Valley Medical",
      address: "456 Pine Road, NY 45678",
      rating: 4.7,
      reviews: 112,
      distance: "1.8 km / 25 min",
      category: "Clinic",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset("assets/images/map.jpg", fit: BoxFit.cover),
          ),

          // Search bar at the top
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(20),
              child: TextField(
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Search doctor...',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
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
          ),

          // Location markers
          Positioned(
            bottom: 250,
            left: 50,
            child: Image.asset(
              "assets/images/location_image.png",
              height: 70,
              width: 70,
            ),
          ),
          Positioned(
            top: 150,
            right: 50,
            child: Image.asset(
              "assets/images/location_image2.png",
              height: 70,
              width: 70,
            ),
          ),
          Positioned(
            top: 220,
            left: 70,
            child: Image.asset(
              "assets/images/location_image2.png",
              height: 70,
              width: 70,
            ),
          ),
          Positioned(
            bottom: 300,
            right: 80,
            child: Image.asset(
              "assets/images/location_image.png",
              height: 70,
              width: 70,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 260, // enough height for the hospital card
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: hospitals.length,
                separatorBuilder: (context, _) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  return HospitalCard(hospital: hospitals[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
