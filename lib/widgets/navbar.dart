import 'package:flutter/material.dart';

import '../utils/responsive_layout.dart';

class NavBar extends StatelessWidget {
  final navLinks = ["Home", "Products", "Features", "Contact", "oooook"];

  NavBar({super.key});

  List<Widget> navItem() {
    return navLinks.map((text) {
      return Padding(
        padding: const EdgeInsets.only(left: 18),
        child:
            Text(text, style: const TextStyle(fontFamily: "Montserrat-Bold")),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Your main content goes here
        Container(
          color: Colors.blue, // Replace with your content
          child: const Center(
            child: Text(
              'Your Main Content',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),

        // Randomly positioned navbar
        Positioned(
          top: 50, // Adjust the top position as needed
          left: 50, // Adjust the left position as needed
          child: Container(
            width: 200, // Adjust the width as needed
            height: 50, // Adjust the height as needed
            color: Colors.red, // Replace with your navbar content
            child: const Center(
              child: Text(
                'Navbar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

@override
Widget build(BuildContext context) {
  return Drawer(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 38),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: const LinearGradient(colors: [
                      Color(0xFFC86DD7),
                      Color(0xFF3023AE),
                    ], begin: Alignment.bottomRight, end: Alignment.topLeft)),
                child: const Center(
                  child: Text("B",
                      style: TextStyle(fontSize: 30, color: Colors.white)),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              const Text("Britu", style: TextStyle(fontSize: 26))
            ],
          ),
          if (!ResponsiveLayout.isSmallScreen(context))
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ...navItem(),
                InkWell(
                    child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 120,
                  height: 40,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 160, 37, 182),
                        Color(0xFF3023AE)
                      ], begin: Alignment.bottomRight, end: Alignment.topLeft),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xFF6078ea).withOpacity(.3),
                            offset: const Offset(0, 8),
                            blurRadius: 8)
                      ]),
                  child: const Material(
                    color: Colors.transparent,
                    child: Center(
                      child: Text("Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              letterSpacing: 1,
                              fontFamily: "Montserrat-Bold")),
                    ),
                  ),
                ))
              ],
            )
          else
            IconButton(
              icon: Image.asset("assets/menu.png", width: 25, height: 25),
              onPressed: () {
                Drawer();
              },
            ),
        ],
      ),
    ),
  );
}
