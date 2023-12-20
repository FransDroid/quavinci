import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quavinci/src/screens/trending_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController controller;
  int _currentIndex = 0;

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: _buildBody(),
        bottomNavigationBar: TabBar(
          controller: controller,
          indicatorWeight: 5,
          indicatorColor: Theme.of(context).primaryColor,
          indicatorSize: TabBarIndicatorSize.label,
          unselectedLabelColor: Colors.grey,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          tabs: [
            createBottomNavItem(Icons.home_outlined, Colors.grey),
            createBottomNavItem(Icons.language_outlined, Colors.grey),
            createBottomNavItem(CupertinoIcons.chat_bubble, Colors.grey),
            createBottomNavItem(Icons.mail_outline, Colors.grey),
          ],
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
      ),
    );
  }

  Tab createBottomNavItem(IconData iconData, Color color) {
    return Tab(
      icon: Icon(
        iconData,
        color: color,
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return const TrendingScreen();
      case 1:
        return Container();
      case 2:
        return Container();
      case 3:
        return Container();
      default:
        return Container();
    }
  }
}
