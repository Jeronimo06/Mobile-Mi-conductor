import 'package:flutter/material.dart';
import 'driver_home_screen.dart';
import 'driver_start_verification_screen.dart';
import 'driver_history_screen.dart';
import 'login_screen.dart';

class DriverSection extends StatefulWidget {
  const DriverSection({super.key});

  @override
  State<DriverSection> createState() => _DriverSectionState();
}

class _DriverSectionState extends State<DriverSection> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _screens = [
    const DriverHomeScreen(),
    const DriverStartVerificationScreen(),
    const DriverHistoryScreen(),
    const Center(child: Text('Profile')),
  ];

  void _logout() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF8A00),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Preparar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                : const Icon(
                    Icons.home_outlined,
                    color: Colors.grey,
                  ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF8A00),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.map,
                      color: Colors.white,
                      size: 22,
                    ),
                  )
                : const Icon(
                    Icons.map_outlined,
                    color: Colors.grey,
                    size: 24,
                  ),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF8A00),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.history,
                      color: Colors.white,
                      size: 22,
                    ),
                  )
                : const Icon(
                    Icons.history_outlined,
                    color: Colors.grey,
                    size: 24,
                  ),
            label: 'Historial',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 3
                ? Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF8A00),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 22,
                    ),
                  )
                : const Icon(
                    Icons.person_outlined,
                    color: Colors.grey,
                    size: 24,
                  ),
            label: 'Perfil',
          ),
        ],
        selectedItemColor: const Color(0xFFFF8A00),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
      appBar: AppBar(
        title: const Text('Mi Conductor'),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: _logout,
            icon: const Icon(Icons.logout),
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
