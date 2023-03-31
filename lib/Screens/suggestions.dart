import 'package:flutter/material.dart';
import 'package:heart_versit/contants/constants.dart';

class Suggestions extends StatefulWidget {
  const Suggestions({super.key});

  @override
  State<Suggestions> createState() => _SuggestionsState();
}

class _SuggestionsState extends State<Suggestions> {
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
                  "Suggestions will be shown here",
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
