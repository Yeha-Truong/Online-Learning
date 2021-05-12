import 'package:flutter/material.dart';
import 'package:flutter_app/views/components/author_card.dart';
import 'package:flutter_app/views/components/course_card.dart';
import 'package:flutter_app/views/components/spacer.dart';
import 'package:flutter_app/views/fragments/course_list_fragment.dart';

class HomeFragment extends StatefulWidget {
  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment>
    with AutomaticKeepAliveClientMixin {
  void _signout(context) {
    Navigator.pop(context);
  }

  void _viewAll(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CourseListFragment()),
    );
  }

  Widget _buildHomeFragment() => ListView(
        children: [
          Container(
            child: Column(
              children: [
                VerticalSpacer(distance: 12.0),
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'New',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      ElevatedButton(
                        onPressed: () => _viewAll(context),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(44, 49, 55, 1)),
                          padding: MaterialStateProperty.all(
                            EdgeInsets.only(
                              left: 12.0,
                              right: 4.0,
                            ),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(18.0),
                              ),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('See all'),
                            Icon(
                              Icons.arrow_right,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  height: 256.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CourseCard(
                        image: AssetImage('assets/default/takodachi.png'),
                        title: 'Building Applications with React and Flux',
                        author: 'Cory House',
                        level: 'Intermediate',
                        date: 'Jun 2019',
                        time: '6h',
                        rating: 4.5,
                        votes: 1366,
                      ),
                      CourseCard(
                        image: AssetImage('assets/default/takodachi.png'),
                        title: 'Building Applications with React and Flux',
                        author: 'Cory House',
                        level: 'Intermediate',
                        date: 'Mar 2019',
                        time: '7h',
                        rating: 4.5,
                        votes: 1476,
                      ),
                      CourseCard(
                        image: AssetImage('assets/default/takodachi.png'),
                        title: 'Building Applications with React and Flux',
                        author: 'Cory House',
                        level: 'Intermediate',
                        date: 'Jun 2019',
                        time: '6h',
                        rating: 4.5,
                        votes: 1366,
                      )
                    ],
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Trending',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      ElevatedButton(
                        onPressed: () => _viewAll(context),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(44, 49, 55, 1)),
                          padding: MaterialStateProperty.all(
                            EdgeInsets.only(
                              left: 12.0,
                              right: 4.0,
                            ),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(18.0),
                              ),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('See all'),
                            Icon(
                              Icons.arrow_right,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  height: 256.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CourseCard(
                        image: AssetImage('assets/default/takodachi.png'),
                        title: 'Building Applications with React and Flux',
                        author: 'Cory House',
                        level: 'Intermediate',
                        date: 'Jun 2019',
                        time: '6h',
                        rating: 4.5,
                        votes: 1366,
                      ),
                      CourseCard(
                        image: AssetImage('assets/default/takodachi.png'),
                        title: 'Building Applications with React and Flux',
                        author: 'Cory House',
                        level: 'Intermediate',
                        date: 'Mar 2019',
                        time: '7h',
                        rating: 4.5,
                        votes: 1476,
                      ),
                      CourseCard(
                        image: AssetImage('assets/default/takodachi.png'),
                        title: 'Building Applications with React and Flux',
                        author: 'Cory House',
                        level: 'Intermediate',
                        date: 'Jun 2019',
                        time: '6h',
                        rating: 4.5,
                        votes: 1366,
                      )
                    ],
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Text(
                    'Top Authors',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16.0),
                  height: 128.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      AuthorCard(
                        image: AssetImage('assets/default/takodachi.png'),
                        author: 'Mark Zuckerberg',
                      ),
                      AuthorCard(
                        image: AssetImage('assets/default/takodachi.png'),
                        author: 'Scott Allen',
                      ),
                      AuthorCard(
                        image: AssetImage('assets/default/takodachi.png'),
                        author: 'Dedora Nigeria',
                      ),
                      AuthorCard(
                        image: AssetImage('assets/default/takodachi.png'),
                        author: 'Samer Buna',
                      ),
                      AuthorCard(
                        image: AssetImage('assets/default/takodachi.png'),
                        author: 'Alicia',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('React'),
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
                    Text('Back'),
                  ],
                ),
                onTap: () => _signout(context),
              ),
            ),
          ),
          leadingWidth: 200.0,
          automaticallyImplyLeading: false,
        ),
        body: _buildHomeFragment());
  }

  @override
  bool get wantKeepAlive => true;
}
