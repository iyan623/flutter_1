import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HasilTingkatKelelahan extends StatelessWidget {
  final int tingkatKelelahan;
  const HasilTingkatKelelahan({super.key, required this.tingkatKelelahan});

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
                'Klasifikasi\nTingkat\nKelelahan\nAnda',
                style: GoogleFonts.poppins(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Image.asset(
                  imageKelelahan(),
                  width: 177.0,
                  height: 177.0,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  teksimageKelelahan(),
                  style: GoogleFonts.poppins(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          Navigator.popUntil(context, (route) => route.isFirst);
        },
        icon: const Icon(
          Icons.arrow_forward_outlined,
          size: 52,
          color: Colors.white,
        ),
      ),
    );
  }

  String imageKelelahan() {
    if (tingkatKelelahan >= 30 && tingkatKelelahan <= 52) {
      return "assets/rendah.png";
    } else if (tingkatKelelahan >= 53 && tingkatKelelahan <= 66) {
      return "assets/sedang.png";
    } else if (tingkatKelelahan >= 67 && tingkatKelelahan <= 98) {
      return "assets/sedikit_lelah.png";
    } else {
      return "assets/sangat_lelah.png";
    }
  }

  String teksimageKelelahan() {
    if (tingkatKelelahan >= 30 && tingkatKelelahan <= 52) {
      return '"Rendah"';
    } else if (tingkatKelelahan >= 53 && tingkatKelelahan <= 66) {
      return '"Sedang"';
    } else if (tingkatKelelahan >= 67 && tingkatKelelahan <= 98) {
      return '"Sedikit Lelah"';
    } else {
      return '"Sangat Lelah"';
    }
  }
}
