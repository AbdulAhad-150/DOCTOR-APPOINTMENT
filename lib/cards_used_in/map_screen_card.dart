import 'package:flutter/material.dart';

class HospitalCard extends StatelessWidget {
  final Hospital hospital;

  const HospitalCard({super.key, required this.hospital});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260, // fixed width for horizontal scrolling
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 3,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hospital Image
            Image.asset(
              hospital.imagePath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    hospital.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  // Address
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          hospital.address,
                          style: const TextStyle(
                              color: Colors.grey, fontSize: 13),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  // Rating + Reviews
                  Row(
                    children: [
                      Text(
                        hospital.rating.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 4),
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            size: 16,
                            color: index < hospital.rating.round()
                                ? Colors.orange
                                : Colors.grey.shade300,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "(${hospital.reviews} Reviews)",
                        style: const TextStyle(
                            color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Distance + Category
                  Row(
                    children: [
                      const Icon(Icons.directions_walk,
                          size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        hospital.distance,
                        style: const TextStyle(
                            color: Colors.grey, fontSize: 13),
                      ),
                      const Spacer(),
                      const Icon(Icons.local_hospital,
                          size: 16, color: Colors.blueAccent),
                      const SizedBox(width: 4),
                      Text(
                        hospital.category,
                        style: const TextStyle(
                            color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// ------------------ MODEL CLASS ------------------
class Hospital {
  final String imagePath;
  final String title;
  final String address;
  final double rating;
  final int reviews;
  final String distance;
  final String category;

  Hospital({
    required this.imagePath,
    required this.title,
    required this.address,
    required this.rating,
    required this.reviews,
    required this.distance,
    required this.category,
  });
}


// ------------------ EXAMPLE USAGE ------------------
// class HospitalListScreen extends StatelessWidget {
//   final List<Hospital> hospitals = [
//     Hospital(
//       imagePath: "assets/images/hospital1.png",
//       title: "Sunrise Health Clinic",
//       address: "123 Oak Street, CA 98765",
//       rating: 5.0,
//       reviews: 58,
//       distance: "2.5 km / 40 min",
//       category: "Hospital",
//     ),
//     Hospital(
//       imagePath: "assets/images/hospital2.png",
//       title: "Green Valley Medical",
//       address: "456 Pine Road, NY 45678",
//       rating: 4.7,
//       reviews: 112,
//       distance: "1.8 km / 25 min",
//       category: "Clinic",
//     ),
//   ];

//   HospitalListScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Hospitals Nearby")),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(12),
//         scrollDirection: Axis.horizontal,
//         itemCount: hospitals.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.only(right: 12),
//             child: HospitalCard(hospital: hospitals[index]),
//           );
//         },
//       ),
//     );
//   }
// }
