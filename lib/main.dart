import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '3D Card Hover',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HoverCard(
              name: 'Stacy',
              image:
                  'https://images.unsplash.com/photo-1594465919760-441fe5908ab0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=80',
              backgroundColor: Colors.brown[300]!,
              buttonColor: const Color.fromARGB(255, 161, 83, 55),
            ),
            HoverCard(
              name: 'Stella',
              image:
                  'https://images.unsplash.com/photo-1555487497-4f6ee7fb7b13?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=80',
              backgroundColor: Colors.red[300]!,
              buttonColor: const Color.fromARGB(255, 226, 55, 55),
            ),
            HoverCard(
              name: 'Gwen',
              image:
                  'https://images.unsplash.com/photo-1636576507919-929955a345c8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=80',
              backgroundColor: Colors.pink[200]!,
              buttonColor: const Color.fromARGB(255, 248, 71, 130),
            ),
          ],
        ),
      ),
    );
  }
}

class HoverCard extends StatefulWidget {
  final String image;
  final Color backgroundColor;
  final String name;
  final Color buttonColor;
  const HoverCard({
    super.key,
    required this.name,
    required this.image,
    required this.backgroundColor,
    this.buttonColor = const Color.fromARGB(255, 33, 33, 33),
  });

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            isHovered = true;
          });
        },
        onExit: (event) {
          setState(() {
            isHovered = false;
          });
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 375),
              curve: Curves.easeOut,
              height: isHovered ? 300.0 : 280.0,
              width: 250.0,
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 375),
              curve: Curves.easeOut,
              top: isHovered ? -100.0 : 0.0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 375),
                curve: Curves.easeOut,
                height: isHovered ? 390.0 : 280.0,
                width: 250.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 375),
                        curve: Curves.easeOut,
                        height: isHovered ? 180.0 : 220.0,
                        width: isHovered ? 180.0 : 220.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            image: NetworkImage(widget.image),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      widget.name,
                      style: GoogleFonts.montserrat(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, \nsed do eiusmod tempor incididunt ut labore et',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.quicksand(
                                  fontSize: 15.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: widget.buttonColor,
                                  foregroundColor:
                                      Colors.white.withOpacity(0.95),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 20.0),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Read More',
                                  style: GoogleFonts.poppins(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
