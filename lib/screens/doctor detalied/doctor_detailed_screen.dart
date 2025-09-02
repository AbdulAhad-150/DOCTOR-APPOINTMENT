// import 'package:flutter/material.dart';
// import 'package:hackathon_smit/cards_used_in/card_all_doctor.dart';

// class DoctorDetailPage extends StatelessWidget {
//   final Doctor doctor;

//   const DoctorDetailPage({super.key, required this.doctor});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(doctor.name)),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               elevation: 3,
//               clipBehavior: Clip.antiAlias,
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Row(
//                   children: [
//                     // Doctor Image
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(12),
//                       child: Image.asset(
//                         doctor.imagePath,
//                         width: 100,
//                         height: 100,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     const SizedBox(width: 12),

//                     // Info Section
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Name + Favorite Icon
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                   doctor.name,
//                                   style: const TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                               // const Icon(
//                               //   Icons.favorite_border,
//                               //   color: Colors.grey,
//                               // ),
//                             ],
//                           ),
//                           // const SizedBox(height: 4),
//                           Divider(),

//                           // Specialty
//                           Text(
//                             doctor.specialty,
//                             style: const TextStyle(
//                               color: Colors.black,
//                               fontSize: 13,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),

//                           const SizedBox(height: 6),

//                           // Location
//                           Row(
//                             children: [
//                               const Icon(
//                                 Icons.location_on,
//                                 size: 16,
//                                 color: Colors.grey,
//                               ),
//                               const SizedBox(width: 4),
//                               Expanded(
//                                 child: Text(
//                                   doctor.location,
//                                   style: const TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 13,
//                                   ),
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               ),
//                             ],
//                           ),

//                           const SizedBox(height: 6),

//                           // // Rating + Reviews
//                           // Row(
//                           //   children: [
//                           //     const Icon(
//                           //       Icons.star,
//                           //       size: 16,
//                           //       color: Colors.orange,
//                           //     ),
//                           //     const SizedBox(width: 4),
//                           //     Text(
//                           //       doctor.rating.toString(),
//                           //       style: const TextStyle(
//                           //         fontWeight: FontWeight.bold,
//                           //       ),
//                           //     ),
//                           //     const SizedBox(width: 6),
//                           //     Text(
//                           //       "${doctor.reviews} Reviews",
//                           //       style: const TextStyle(
//                           //         color: Colors.grey,
//                           //         fontSize: 12,
//                           //       ),
//                           //     ),
//                           //   ],
//                           // ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: 50,
//                       width: 50,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: const Color.fromARGB(255, 224, 221, 221),
//                       ),
//                       child: const Icon(
//                         Icons.people_alt_sharp,
//                         size: 23,
//                         color: Color.fromARGB(255, 48, 47, 47),
//                       ),
//                     ),
//                     SizedBox(height: 2),
//                     Text(" 2,000+"),
//                     SizedBox(height: 2),
//                     Text(
//                       " patients",
//                       style: const TextStyle(color: Colors.grey, fontSize: 13),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: 50,
//                       width: 50,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: const Color.fromARGB(255, 224, 221, 221),
//                       ),
//                       child: const Icon(
//                         Icons.people_alt_sharp,
//                         size: 23,
//                         color: Color.fromARGB(255, 48, 47, 47),
//                       ),
//                     ),
//                     SizedBox(height: 2),
//                     Text(" 2,000+"),
//                     SizedBox(height: 2),
//                     Text(
//                       " patients",
//                       style: const TextStyle(color: Colors.grey, fontSize: 13),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             // Center(
//             //   child: ClipRRect(
//             //     borderRadius: BorderRadius.circular(16),
//             //     child: Image.asset(
//             //       doctor.imagePath,
//             //       width: 150,
//             //       height: 150,
//             //       fit: BoxFit.cover,
//             //     ),
//             //   ),
//             // ),
//             // const SizedBox(height: 20),

//             // Text(
//             //   doctor.name,
//             //   style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             // ),
//             // Text(
//             //   doctor.specialty,
//             //   style: const TextStyle(fontSize: 16, color: Colors.grey),
//             // ),
//             // const SizedBox(height: 10),

//             // Row(
//             //   children: [
//             //     const Icon(Icons.location_on, color: Colors.grey),
//             //     const SizedBox(width: 5),
//             //     Text(doctor.location),
//             //   ],
//             // ),
//             // const SizedBox(height: 10),

//             // Row(
//             //   children: [
//             //     const Icon(Icons.star, color: Colors.orange),
//             //     const SizedBox(width: 5),
//             //     Text(
//             //       "${doctor.rating} (${doctor.reviews} reviews)",
//             //       style: const TextStyle(fontSize: 16),
//             //     ),
//             //   ],
//             // ),
//             const SizedBox(height: 30),

//             ElevatedButton(
//               onPressed: () {
//                 // Navigate to booking screen
//               },
//               style: ElevatedButton.styleFrom(
//                 minimumSize: const Size(double.infinity, 50),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               child: const Text("Book Appointment"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hackathon_smit/cards_used_in/card_all_doctor.dart';
import 'package:hackathon_smit/screens/doctor%20detalied/booking_screen.dart';

class DoctorDetailPage extends StatelessWidget {
  final Doctor doctor;

  const DoctorDetailPage({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(doctor.name), centerTitle: true, elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor Info Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    // Doctor Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        doctor.imagePath,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Doctor Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctor.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Divider(),
                          Text(
                            doctor.specialty,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                size: 16,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  doctor.location,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Stats Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _StatBox(
                  icon: Icons.people_alt,
                  label: "2,000+",
                  sub: "patients",
                ),
                _StatBox(icon: Icons.work, label: "10+", sub: "experience"),
                _StatBox(icon: Icons.star, label: "5", sub: "rating"),
                _StatBox(icon: Icons.reviews, label: "1,872", sub: "reviews"),
              ],
            ),

            const SizedBox(height: 30),

            // About Section
            const Text(
              "About me",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "${doctor.name}, a dedicated ${doctor.specialty}, brings years of experience to ${doctor.location}.",
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Working Time
            const Text(
              "Working Time",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Monday-Friday, 08:00 AM - 06:00 PM",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 80), // extra space before button
          ],
        ),
      ),

      // Book Appointment Button Fixed at Bottom
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          height: 55,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookAppointmentPage()),
              );
            },
            child: const Text(
              "Book Appointment",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final IconData icon;
  final String label;
  final String sub;

  const _StatBox({
    super.key,
    required this.icon,
    required this.label,
    required this.sub,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 224, 221, 221),
          ),
          child: Icon(icon, size: 25, color: Colors.black),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(sub, style: const TextStyle(color: Colors.grey, fontSize: 13)),
      ],
    );
  }
}
