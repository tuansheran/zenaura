import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zenaura/pages/home.dart';
import 'package:zenaura/pages/iam.dart';
import 'package:zenaura/pages/profile.dart';

class NavigationBottom extends StatefulWidget {
  const NavigationBottom({super.key});

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  int _selectedIndex = 1;

  void _navigatenBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [HomePage(), IAMPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        // fixedColor: Colors.transparent,
        backgroundColor: Colors.white,
        selectedLabelStyle: TextStyle(fontFamily: 'Poppins'),
        unselectedLabelStyle: TextStyle(fontFamily: 'Poppins'),
        onTap: _navigatenBottomBar,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/home.svg'), label: 'Info'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/eye.svg',
                width: 24,
                height: 24,
              ),
              label: 'I AM'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/profile.svg'),
              label: 'Saves'),
        ],
      ),
    );
  }
}
