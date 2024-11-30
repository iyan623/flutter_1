import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/profil_page.dart';
import '../pages/rules_page.dart';

class HomePage extends StatelessWidget {
  final String name;
  const HomePage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7B6DE4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Center(),
            Column(
              children: [
                Image.asset(
                  "assets/Image1.png",
                  width: 256.0,
                  height: 256.0,
                  fit: BoxFit.cover,
                ),
                Text(
                  'Welcome',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(4, 4),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.home),
                    color: Colors.white,
                    iconSize: 53,
                    style: IconButton.styleFrom(
                      shadowColor: Colors.black.withOpacity(0.2),
                      elevation: 8,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          settings: const RouteSettings(name: 'homePage'),
                          builder: (context) => const RulesPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(172, 52),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadowColor: Colors.black.withOpacity(0.5),
                      elevation: 8,
                    ),
                    child: Text(
                      'Masuk',
                      style: GoogleFonts.poppins(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff7B6DE4),
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(1, 1),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilPage(name: name),
                        ),
                      );
                    },
                    icon: const Icon(Icons.person),
                    color: Colors.white,
                    iconSize: 53,
                    style: IconButton.styleFrom(
                      shadowColor: Colors.black.withOpacity(0.2),
                      elevation: 8,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
