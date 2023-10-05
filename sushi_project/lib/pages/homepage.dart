import 'package:flutter/material.dart';
import './explore.dart';
import './home.dart';
import './library.dart';
import './setting.dart';
// import 'package:video_player/video_player.dart';
// Add this import for the NetworkImage

class HomePageScreen extends StatefulWidget {
  final String id;
  const HomePageScreen({super.key, required this.id});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageScreen> {
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    try {
      _currentIndex = int.parse(widget.id);
    } catch (e) {
      // Handle the exception here if the string cannot be parsed as an integer
      debugPrint('Error: ${e.toString()}');
    }
  }

  List<String> libraryItem = [];
  final List<Widget> _screens = [
    Home(),
    const Explore(),
    const MyLibrary(),
    const Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00252525),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0x00252525),
        selectedItemColor: const Color(0xFFEF873D),
        unselectedItemColor: Colors.white.withOpacity(.6),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'My Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}
