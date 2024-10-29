

import 'package:flutter/material.dart';
import 'package:login/screens/dashboard_screen.dart';
import 'package:login/screens/profile_screen.dart';

class MainpageScreen extends StatefulWidget {
  const MainpageScreen({super.key});

  @override
  State<MainpageScreen> createState() => _MainpageScreenState();
}

class _MainpageScreenState extends State<MainpageScreen> {
  int _selectedIndex = 0;
  bool isLoading = false;

  // List of pages corresponding to the bottom navigation items
  final List<Widget> _pages = [
    const DashboardScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Fungsi untuk menampilkan dialog konfirmasi logout
  Future<bool> _showExitConfirmationDialog() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Logout'),
            content: Text('Apakah Anda ingin keluar dari aplikasi?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Tidak'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Ya'),
              ),
            ],
          ),
        )) ??
        false;
  }

  // Fungsi untuk menangani tombol Back
  Future<bool> _onWillPop() async {
    print('invoked');
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: _pages[_selectedIndex],
        floatingActionButton: ClipOval(
          child: FloatingActionButton(
            onPressed: () {
              // Action for the middle button
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Tombol Utama'),
                    content: const Text('Ini adalah tombol utama di tengah'),
                    actions: [
                      TextButton(
                        child: const Text('Tutup'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: const Icon(Icons.add),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 20,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  void logout(BuildContext context) {
    print('logout invoked');
  }
}
// BottomAppBar(shape: CircularNotchedRectangle(), child: ) // digunakan untuk 