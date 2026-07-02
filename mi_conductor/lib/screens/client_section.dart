import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'request_ride_screen.dart';
import 'my_vehicles_screen.dart';

class ClientSection extends StatefulWidget {
  final bool isGuest;

  const ClientSection({super.key, required this.isGuest});

  @override
  State<ClientSection> createState() => _ClientSectionState();
}

class _ClientSectionState extends State<ClientSection> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _screens = [
    const RequestRideScreen(),
    const MyVehiclesScreen(),
    const Center(child: Text('Activity')),
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
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF8A00),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 22,
                    ),
                  )
                : const Icon(
                    Icons.home_outlined,
                    color: Colors.grey,
                    size: 24,
                  ),
            label: 'home',
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
                      Icons.design_services,
                      color: Colors.white,
                      size: 22,
                    ),
                  )
                : const Icon(
                    Icons.design_services_outlined,
                    color: Colors.grey,
                    size: 24,
                  ),
            label: 'Services',
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
                      Icons.access_time,
                      color: Colors.white,
                      size: 22,
                    ),
                  )
                : const Icon(
                    Icons.access_time_outlined,
                    color: Colors.grey,
                    size: 24,
                  ),
            label: 'Activity',
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
            label: 'Profile',
          ),
        ],
        selectedItemColor: const Color(0xFFFF8A00),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
      appBar: AppBar(
        title: widget.isGuest ? const Text('Modo Invitado') : const Text('Mi Conductor'),
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
