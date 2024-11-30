import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/hasil_tingkat_kelelahan.dart';

class TingkatKelelahanPage extends StatelessWidget {
  final String tingkatKelelahan;
  const TingkatKelelahanPage({super.key, required this.tingkatKelelahan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7B6DE4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Klasifikasi\nTingkat\nKelelahan',
                style: GoogleFonts.poppins(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '30 - 52   : Rendah\n53 - 66   : Sedang\n67 - 98   : Sedikit Lelah\n99 - 120 : Sangat Lelah',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HasilTingkatKelelahan(
                tingkatKelelahan: int.parse(tingkatKelelahan),
              ),
            ),
          );
        },
        icon: const Icon(
          Icons.arrow_forward_outlined,
          size: 52,
          color: Colors.white,
        ),
      ),
    );
  }
}
