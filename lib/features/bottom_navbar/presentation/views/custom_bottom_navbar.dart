import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:task_management_app/features/calendar/presentation/views/calendar_screen.dart';
import 'package:task_management_app/features/home/presentation/views/home_screen.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  int _selectedIndex = 0;

  void _navigateGoogleNavbar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [const HomeScreen(), const CalendarScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
          child: GNav(
            curve: Curves.linear,
            backgroundColor: Colors.transparent,
            padding: const EdgeInsets.all(12),
            tabBackgroundColor: Colors.black,
            activeColor: Colors.white,
            gap: 0,
            onTabChange: _navigateGoogleNavbar,
            tabs: const [
              GButton(icon: Icons.home, text: 'Home', gap: 5),
              GButton(icon: Icons.calendar_month, text: 'Calendar', gap: 5),
            ],
          ),
        ),
      ),
    );
  }
}
