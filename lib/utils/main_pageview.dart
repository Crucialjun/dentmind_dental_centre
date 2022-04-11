import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:dentmind_dental_centre/screens/appointments_screens.dart';
import 'package:dentmind_dental_centre/screens/help_screen.dart';
import 'package:dentmind_dental_centre/screens/main_dashboard.dart';
import 'package:dentmind_dental_centre/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({Key? key}) : super(key: key);

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark),
      ),
      bottomNavigationBar: BottomNavyBar(
          selectedIndex: _selectedIndex,
          onItemSelected: (value) {
            setState(() {
              _selectedIndex = value;
              _pageController.jumpToPage(value);
            });
          },
          items: [
            BottomNavyBarItem(
              icon: const Icon(Icons.apps),
              title: const Text('Home'),
              activeColor: Colors.red,
            ),
            BottomNavyBarItem(
                icon: const Icon(Icons.notes),
                title: const Text('Bookings'),
                activeColor: Colors.purpleAccent),
            BottomNavyBarItem(
                icon: const Icon(Icons.help),
                title: const Text('Help'),
                activeColor: Colors.pink),
            BottomNavyBarItem(
                icon: const Icon(Icons.person),
                title: const Text('Profile'),
                activeColor: Colors.blue),
          ]),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _selectedIndex = index);
        },
        children: const [
          MainDashboard(),
          AppointmentsScreen(),
          HelpScreen(),
          ProfileScreen()
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
