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
    const _DriverLogoutScreen(),
  ];

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
                      'Inicio',
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
                      Icons.logout,
                      color: Colors.white,
                      size: 22,
                    ),
                  )
                : const Icon(
                    Icons.logout_outlined,
                    color: Colors.grey,
                    size: 24,
                  ),
            label: 'Cerrar Sesión',
          ),
        ],
        selectedItemColor: const Color(0xFFFF8A00),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}

class _DriverLogoutScreen extends StatelessWidget {
  const _DriverLogoutScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F8),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF8A00),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 64,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Tu perfil de conductor',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 48),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF8A00),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Cerrar Sesión',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
