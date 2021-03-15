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
  static List<Widget> _fragments = <Widget>[
    HomeFragment(),
    DownloadFragment(),
    Container(),
    SearchFragment(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _fragments.elementAt(_index),
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
        onTap: (index) => {
          setState(() {
            _index = index;
          })
        },
      ),
    );
  }
}
