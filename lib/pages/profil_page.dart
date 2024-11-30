import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilPage extends StatelessWidget {
  final String name;
  const ProfilPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7B6DE4),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTextButton(
              name: name,
              func: () {},
              icon: Icons.person,
            ),
            MyTextButton(
              name: 'Kelola Akun',
              func: () {},
              icon: Icons.settings,
            ),
            MyTextButton(
              name: 'Pertanyaan Seputas Aplikasi',
              func: () {},
              icon: Icons.question_mark_outlined,
            ),
            MyTextButton(
              name: 'Keluar',
              func: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (route) => false,
                );
              },
              icon: Icons.close_rounded,
            ),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          size: 52,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}

class MyTextButton extends StatelessWidget {
  const MyTextButton(
      {super.key, required this.name, required this.func, required this.icon});

  final String name;
  final Function() func;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: func,
      label: Text(
        name,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      icon: Icon(
        icon,
        size: 35,
        color: Colors.white,
      ),
    );
  }
}
