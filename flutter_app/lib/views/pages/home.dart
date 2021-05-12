import 'package:flutter/material.dart';
import 'package:flutter_app/views/fragments/download_fragment.dart';
import 'package:flutter_app/views/fragments/home_fragment.dart';
import 'package:flutter_app/views/fragments/search_fragment.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  PageController _pageController = PageController();
  List<Widget> _pages = <Widget>[
    HomeFragment(),
    DownloadFragment(),
    Container(),
    SearchFragment(),
  ];

  void _onPageChange(index) {
    setState(() {
      _index = index;
    });
  }

  void _onTap(index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: _onPageChange,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_circle_down_outlined),
            label: 'Download',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions_outlined),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        currentIndex: _index,
        selectedItemColor: Colors.cyanAccent[400],
        onTap: _onTap,
      ),
    );
  }
}
