import 'package:flutter/material.dart';

class HealthClinicCard extends StatelessWidget {
  final String clinicName;
  final String imageUrl;
  final VoidCallback? onTap;

  const HealthClinicCard({
    Key? key,
    required this.clinicName,
    required this.imageUrl,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Clinic Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Container(
                height: 120,
                width: double.infinity,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback hospital/clinic image
                    return Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.blue[50]!, Colors.blue[100]!],
                        ),
                      ),
                      child: Stack(
                        children: [
                          // Background pattern
                          Positioned.fill(
                            child: CustomPaint(
                              painter: HospitalPatternPainter(),
                            ),
                          ),
                          // Center hospital icon
                          const Center(
                            child: Icon(
                              Icons.local_hospital,
                              size: 40,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            // Clinic Name
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                clinicName,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom painter for hospital background pattern
class HospitalPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1)
      ..strokeWidth = 1;

    // Draw grid pattern
    for (double i = 0; i < size.width; i += 20) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    for (double i = 0; i < size.height; i += 20) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Example usage with multiple clinic cards
class ClinicsSection extends StatelessWidget {
  const ClinicsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        SizedBox(
          height: 170,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              HealthClinicCard(
                clinicName: 'Sunrise Health Clinic',
                imageUrl:
                    'https://images.unsplash.com/photo-1538108149393-fbbd81895907?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
                onTap: () {
                  print('Sunrise Health Clinic tapped');
                },
              ),
              HealthClinicCard(
                clinicName: 'Metro Medical Center',
                imageUrl:
                    'https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
                onTap: () {
                  print('Metro Medical Center tapped');
                },
              ),
              HealthClinicCard(
                clinicName: 'City General Hospital',
                imageUrl:
                    'https://images.unsplash.com/photo-1504813184591-01572f98c85f?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
                onTap: () {
                  print('City General Hospital tapped');
                },
              ),
              HealthClinicCard(
                clinicName: 'Prime Care Clinic',
                imageUrl:
                    'https://images.unsplash.com/photo-1486162928267-4e3c57e23e2d?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
                onTap: () {
                  print('Prime Care Clinic tapped');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Demo app showing the cards in action
class ClinicCardsDemo extends StatelessWidget {
  const ClinicCardsDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('HealthPal Clinics'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: ClinicsSection(),
        ),
      ),
    );
  }
}
