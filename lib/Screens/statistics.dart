import 'package:flutter/material.dart';
import 'package:heart_versit/contants/constants.dart';

import 'background.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
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
                Text(
                  "Stats will be shown here",
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
