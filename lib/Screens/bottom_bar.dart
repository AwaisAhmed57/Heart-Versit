import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heart_versit/Screens/aboutus.dart';
import 'package:heart_versit/Screens/start_screen.dart';
import 'package:heart_versit/Screens/statistics.dart';
import 'package:heart_versit/Screens/suggestions.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static final List<Widget> _WidgetOptions = <Widget>[
    const StartScreen(),
    const Statistics(),
    const Suggestions(),
    const AboutUs(),
  ];
  void _onitemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Heart Versit"),
        ),
        body: Center(
          child: _WidgetOptions[_selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onitemTapped,
          elevation: 10,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.red,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.blueGrey,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.heartCirclePlus),
                label: "Diagnosis"),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_outlined), label: "Statistics"),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.goodreads), label: "Suggestions"),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.personCircleQuestion),
                label: "About Us"),
          ],
        ));
  }
}
