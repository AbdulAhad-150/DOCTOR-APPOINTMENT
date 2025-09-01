import 'package:flutter/material.dart';
import 'package:hackathon_smit/cards_used_in/card_all_doctor.dart';

class AllDoctorList extends StatefulWidget {
  const AllDoctorList({super.key});

  @override
  State<AllDoctorList> createState() => _AllDoctorListState();
}

class _AllDoctorListState extends State<AllDoctorList> {
  String selectedCategory = 'All';

  // Example doctors list
  final List<Doctor> doctors = [
    Doctor(
      imagePath: "assets/images/doctor1.png",
      name: "Dr. David Patel",
      specialty: "Cardiology",
      location: "Cardiology Center, USA",
      rating: 5.0,
      reviews: 1872,
    ),
    Doctor(
      imagePath: "assets/images/doctor2.png",
      name: "Dr. Jessica Turner",
      specialty: "Gynecology",
      location: "Women's Clinic, Seatle, USA",
      rating: 4.9,
      reviews: 127,
    ),
    Doctor(
      imagePath: "assets/images/doctor3.png",
      name: "Dr. Michael Smith",
      specialty: "Dentist",
      location: "Smile Dental Care, USA",
      rating: 4.7,
      reviews: 652,
    ),
    Doctor(
      imagePath: "assets/images/doctor4.png",
      name: "Dr. Emma Wilson",
      specialty: "General",
      location: "City Hospital, USA",
      rating: 4.5,
      reviews: 321,
    ),
  ];

  //  Filter doctors by category
  List<Doctor> get filteredDoctors {
    if (selectedCategory == "All") {
      return doctors;
    } else {
      return doctors
          .where(
            (doc) =>
                doc.specialty.toLowerCase() == selectedCategory.toLowerCase(),
          )
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All Doctors")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              //  Search bar
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

              //  Categories
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      textBox("All"),
                      textBox("General"),
                      textBox("Cardiology"),
                      textBox("Dentist"),
                      textBox("Gynecology"),
                    ],
                  ),
                ),
              ),

              // Header row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${filteredDoctors.length} founds',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Text(
                          'Default',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w100,
                            color: Colors.grey,
                          ),
                        ),
                        Icon(Icons.compare_arrows_rounded),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              //  Doctors list
              Expanded(
                child: filteredDoctors.isEmpty
                    ? const Center(
                        child: Text(
                          "No doctors found",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: filteredDoctors.length,
                        itemBuilder: (context, index) {
                          return CardAllDoctor(doctor: filteredDoctors[index]);
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //  Category Button
  Widget textBox(String text) {
    final bool isSelected = selectedCategory == text;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = text;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 100,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff1f293a) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.grey.shade400,
            width: 1.2,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF747373),
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
