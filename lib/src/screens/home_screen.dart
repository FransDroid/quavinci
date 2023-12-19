import 'package:flutter/material.dart';
import 'package:quavinci/src/screens/trending_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.shade100,
        items: [
          createBottomNavItem(Icons.home, Colors.grey),
          createBottomNavItem(Icons.wordpress_outlined, Colors.grey),
          createBottomNavItem(Icons.chat_bubble_outline, Colors.grey),
          createBottomNavItem(Icons.mail_outline, Colors.grey),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  BottomNavigationBarItem createBottomNavItem(IconData iconData, Color color) {
    return BottomNavigationBarItem(
        icon: Icon(
          iconData,
          color: color,
        ),
        label: '');
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return const TrendingScreen();
      case 1:
        return Container(color: Colors.teal,);
      case 2:
        return Container();
      case 3:
        return Container();
      default:
        return Container();
    }
  }
}
