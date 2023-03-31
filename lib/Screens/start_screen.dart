import 'package:breathing_collection/breathing_collection.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heart_versit/Screens/diagnose_screen.dart';

import '../contants/constants.dart';
import 'background.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: CustomPaint(
        painter: BacgroundPaint(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BreathingGlowingButton(
                height: 100,
                width: 100,
                buttonBackgroundColor: heartColor,
                glowColor: waveColor,
                icon: FontAwesomeIcons.heartPulse,
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) {
                    return const DiagnoseScreen();
                  }));
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Start Diagnosis",
                style: appText(
                    isShadow: true,
                    color: Colors.white,
                    weight: FontWeight.w500,
                    size: 23),
              )
            ],
          ),
        ),
      ),
    );
  }
}
