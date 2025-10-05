import 'package:flutter/material.dart';
import 'package:tralalelo_pra_ukk/beranda/beranda_page.dart';
import 'package:tralalelo_pra_ukk/profile/profile_page.dart';
import 'package:tralalelo_pra_ukk/task/task_list_page.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static _HomePageState? of(BuildContext context) {
    return context.findAncestorStateOfType<_HomePageState>();
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    const BerandaPage(),
    const TaskListPage(),
    const ProfilePage(),
  ];

  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const ClampingScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: changePage,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/icons8-home.svg',
              width: 25,
              height: 25,
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(
              'assets/svg/icons8-home-solid.svg',
              height: 25,
              width: 25,
              color: Colors.green,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_outlined, size: 30),
            activeIcon: Icon(Icons.task_rounded, color: Colors.green, size: 30),
            label: 'Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded, size: 30),
            activeIcon: Icon(Icons.person_sharp, color: Colors.green, size: 30),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
