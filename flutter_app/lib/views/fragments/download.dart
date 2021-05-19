import 'package:flutter/material.dart';
import 'package:flutter_app/views/components/course_list_tile.dart';

class DownloadFragment extends StatefulWidget {
  @override
  _DownloadFragmentState createState() => _DownloadFragmentState();
}

class _DownloadFragmentState extends State<DownloadFragment>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Downloads'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(children: [
        FractionallySizedBox(
          widthFactor: 0.9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Downloads',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              TextButton(
                onPressed: () => {},
                child: Text('Remove all'),
              ),
            ],
          ),
        ),
        Expanded(
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
      ]),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
