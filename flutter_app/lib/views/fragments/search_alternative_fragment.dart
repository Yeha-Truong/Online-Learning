import 'package:flutter/material.dart';
import 'package:flutter_app/views/components/course_list_tile.dart';

class SearchAlternativeFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(128.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Container(
                margin: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 40.0),
                child: Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFormField(
                          autofocus: false,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            suffixIcon: Icon(Icons.cancel),
                            hintText: 'Search',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 0.0,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => {},
                        child: Text('Cancel'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottom: TabBar(tabs: [
              Tab(
                child: Text('All'),
              ),
              Tab(
                child: Text('Courses'),
              ),
              Tab(
                child: Text('Paths'),
              ),
              Tab(
                child: Text('Authors'),
              ),
            ]),
          ),
        ),
        body: TabBarView(
          children: [
            Container(
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
                      title:
                          'Using ASP.NET Core to Build Sing-page Applications',
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
            Container(
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
                      title:
                          'Using ASP.NET Core to Build Sing-page Applications',
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
            Container(
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
                      title:
                          'Using ASP.NET Core to Build Sing-page Applications',
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
            Container(
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
                      title:
                          'Using ASP.NET Core to Build Sing-page Applications',
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
          ],
        ),
      ),
    );
  }
}
