import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:heart_versit/Screens/bottom_bar.dart';
import 'package:heart_versit/Screens/start_screen.dart';

import '../contants/constants.dart';
import 'background.dart';

class DiagnoseScreen extends StatefulWidget {
  const DiagnoseScreen({super.key});

  @override
  State<DiagnoseScreen> createState() => _DiagnoseScreenState();
}

class _DiagnoseScreenState extends State<DiagnoseScreen>
    with SingleTickerProviderStateMixin {
  bool isprocessing = false;
  late Timer _timer;
  final int _start = 5;
  bool timesUp = false;
  //late CameraController cameraController;
  //late Bpm bpm;
  //XFile? videoFile;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final Animation<double> _animation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  ));
  bool isProcessing = true;
  double sec = 0;
  List<FlSpot> spots = [];
  bool recordComplete = false;
  String maxBpm = "";
  String minBpm = "";
  final ValueNotifier<bool> isFinger = ValueNotifier(true);

  get processText => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: CustomPaint(
        painter: BacgroundPaint(),
        // return Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const Spacer(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Stack(
                  //alignment: Alignment.center,
                  children: [
                    DemoCircleWave(
                      count: 200,
                      isProcessing: false,
                    ),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return const BottomBar();
                    }));
                  },
                  child: Text(
                    "Back to Home Page",
                    style: appText(
                        color: Colors.white,
                        isShadow: true,
                        size: 20,
                        weight: FontWeight.w600),
                  )),
              //        !isProcessing
              //         ? Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             mainAxisSize: MainAxisSize.min,
              //             crossAxisAlignment: CrossAxisAlignment.baseline,
              //             textBaseline: TextBaseline.alphabetic,

              //          )
              //     : Transform.rotate(
              //           angle: -0.3,
              //             child: LottieBuilder.asset(
              //               "assets/heart_bubble.json",
              //             )),
              // ])),
              // const Spacer(),
              // isProcessing
              //     ? const SizedBox(
              //         height: 70,
              //         width: 60,
              //         child: ClipOval(
              //           child: AspectRatio(
              //             aspectRatio: 1,
              //           ),
              //         ),
              //       )
              //     : TextButton(
              //         onPressed: () {
              //           Navigator.pushReplacement(context,
              //               MaterialPageRoute(builder: (_) {
              //             return const StartScreen();
              //           }));
              //         },
              //         child: Text(
              //           "Take test again?",
              //           style: appText(
              //               color: Colors.white,
              //               isShadow: true,
              //               size: 20,
              //               weight: FontWeight.w600),
              //         )),
              // const SizedBox(
              //   height: 10,
              // ),
              // isProcessing
              //     ? Center(
              //         child: Text(
              //           timesUp ? processText : "Test starts in $_start",
              //           style: appText(
              //               color: Colors.white,
              //               isShadow: true,
              //               size: 14,
              //               weight: FontWeight.w600),
              //         ),
              //       )
              //     : Container(),
              // Padding(
              //   padding: const EdgeInsets.only(top: 20),
              //   child: Center(
              //     child: Container(
              //       width: MediaQuery.of(context).size.width,
              //       height: MediaQuery.of(context).size.height * 0.27,
              //       decoration: BoxDecoration(
              //           gradient: LinearGradient(
              //               begin: Alignment.topCenter,
              //               end: Alignment.bottomCenter,
              //               colors: [
              //             heartColor,
              //             lightWaveColor.withOpacity(0.5)
              //           ])),
              //       child: isProcessing
              //           ? const Align(
              //               alignment: Alignment.bottomCenter,
              //               child: Padding(
              //                 padding: EdgeInsets.only(bottom: 20),
              //               ),
              //             )
              //           : Align(
              //               alignment: Alignment.bottomCenter,
              //               child: Padding(
              //                 padding: const EdgeInsets.only(bottom: 20),
              //                 child: Row(
              //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //                   children: [
              //                     Text.rich(
              //                       TextSpan(
              //                         children: [
              //                           TextSpan(
              //                               text: maxBpm,
              //                               style: appText(
              //                                   size: 23,
              //                                   color: heartColor,
              //                                   weight: FontWeight.w500)),
              //                           TextSpan(
              //                             text: ' BPM',
              //                             style: appText(
              //                                 color: waveColor,
              //                                 weight: FontWeight.w500),
              //                           ),
              //                           TextSpan(
              //                               text: '\nMAX',
              //                               style: appText(
              //                                   color: Colors.white,
              //                                   weight: FontWeight.w500)),
              //                         ],
              //                       ),
              //                       textAlign: TextAlign.center,
              //                     ),
              //                     Text.rich(
              //                       TextSpan(
              //                         children: [
              //                           TextSpan(
              //                               text: minBpm,
              //                               style: appText(
              //                                   size: 23,
              //                                   color: heartColor,
              //                                   weight: FontWeight.w500)),
              //                           TextSpan(
              //                             text: ' BPM',
              //                             style: appText(
              //                                 color: waveColor,
              //                                 weight: FontWeight.w500),
              //                           ),
              //                           TextSpan(
              //                               text: '\nMIN',
              //                               style: appText(
              //                                   color: Colors.white,
              //                                   weight: FontWeight.w500)),
              //                         ],
              //                       ),
              //                       textAlign: TextAlign.center,
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
