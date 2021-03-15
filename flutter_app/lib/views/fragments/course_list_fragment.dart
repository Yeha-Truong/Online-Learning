import 'package:flutter/material.dart';
import 'package:flutter_app/views/components/course_list_tile.dart';

class CourseListFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New'),
        centerTitle: true,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            // margin: EdgeInsets.only(left: 8.0),
            child: GestureDetector(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.keyboard_arrow_left,
                    size: 32.0,
                  ),
                  Text('React'),
                ],
              ),
              onTap: () => {},
            ),
          ),
        ),
        leadingWidth: 200.0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 8.0),
        child: ListView(
          children: [
            CourseListTile(
                image: AssetImage('assets/default/takodachi.png'),
                title: 'Building Applications with React and Flux',
                author: 'Cory House',
                level: 'Intermediate',
                date: 'Jun 19, 2019',
                time: '5h11m',
                rating: 5),
            Divider(),
            CourseListTile(
                image: AssetImage('assets/default/takodachi.png'),
                title: 'Building Applications with React and Flux',
                author: 'Cory House',
                level: 'Intermediate',
                date: 'Mar 12, 2019',
                time: '6h39m',
                rating: 5),
            Divider(),
            CourseListTile(
                image: AssetImage('assets/default/takodachi.png'),
                title: 'Client Side React Router 4',
                author: 'David Starr',
                level: 'Intermediate',
                date: 'Mar 2, 2018',
                time: '1h59m',
                rating: 4.5),
            Divider(),
            CourseListTile(
                image: AssetImage('assets/default/takodachi.png'),
                title: 'Advanced React.js',
                author: 'Samer Buna',
                level: 'Advanced',
                date: 'Jun 21, 2017',
                time: '3h55m',
                rating: 4.5),
            Divider(),
            CourseListTile(
                image: AssetImage('assets/default/takodachi.png'),
                title: 'Using ASP.NET Core to Build Sing-page Applications',
                author: 'Ajden Towfeek',
                level: 'Beginner',
                date: 'Apr 12, 2017',
                time: '2h',
                rating: 4.0),
            Divider(),
            CourseListTile(
                image: AssetImage('assets/default/takodachi.png'),
                title: 'Mastering Flux and Redux',
                author: 'Cory House',
                level: 'Intermediate',
                date: 'Jun 2019',
                time: '6h',
                rating: 4.5),
          ],
        ),
      ),
    );
  }
}
