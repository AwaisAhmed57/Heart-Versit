import 'package:flutter/material.dart';
import 'package:heart_versit/contants/constants.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: CustomPaint(
        // painter: BacgroundPaint(),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "About Us will be shown here",
                  style: appText(
                      isShadow: true,
                      color: Colors.white,
                      weight: FontWeight.w500,
                      size: 23),
                ),
              ]),
        ),
      ),
    );
  }
}
