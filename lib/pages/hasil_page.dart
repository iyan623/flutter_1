import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/tingkat_kelelahan_page.dart';

class HasilPage extends StatelessWidget {
  final String totalNilai;
  const HasilPage({super.key, required this.totalNilai});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7B6DE4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/profits.png",
              width: 171.0,
              height: 171.0,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Tingkat\nKelelahan\nAnda',
              style: GoogleFonts.poppins(
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Text(
              totalNilai,
              style: GoogleFonts.poppins(
                fontSize: 128,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  TingkatKelelahanPage(tingkatKelelahan: totalNilai),
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
