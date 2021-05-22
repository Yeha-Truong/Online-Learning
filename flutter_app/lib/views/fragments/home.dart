import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/networking/blocs/courses_bloc.dart';
import 'package:flutter_app/networking/repository/courses_repository.dart';
import 'package:flutter_app/networking/response.dart';
import 'package:flutter_app/provider/user_provider.dart';
import 'package:flutter_app/views/components/author_card.dart';
import 'package:flutter_app/views/components/course_card.dart';
import 'package:flutter_app/views/utils/spacer.dart';
import 'package:provider/provider.dart';

class HomeFragment extends StatefulWidget {
  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment>
    with AutomaticKeepAliveClientMixin {
  late CoursesBloc _new;
  late CoursesBloc _rate;
  late CoursesBloc _sell;
  late UserProvider _userProvider;

  @override
  void initState() {
    super.initState();
    _new = new CoursesBloc();
    _rate = new CoursesBloc();
    _sell = new CoursesBloc();
    _new.topCourses(CoursesType.NEW, 10, 1);
    _rate.topCourses(CoursesType.RATE, 10, 1);
    _sell.topCourses(CoursesType.SELL, 10, 1);
  }

  @override
  didChangeDependencies() {
    _userProvider = Provider.of<UserProvider>(context, listen: true);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _viewAll(context, CoursesType type) {
    Navigator.pushNamed(context, '/courses', arguments: type);
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
                        onPressed: () => _viewAll(context, CoursesType.NEW),
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
                  child: StreamBuilder<Response<List<CourseInfo>>>(
                    stream: _new.courseStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        switch (snapshot.data!.status) {
                          case Status.LOADING:
                            return SizedBox(
                              height: 48.0,
                              width: 48.0,
                              child: CircularProgressIndicator(),
                            );
                          case Status.COMPLETED:
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => CourseCard(
                                info: snapshot.data!.data![index],
                              ),
                              itemCount: snapshot.data!.data!.length,
                            );
                          case Status.ERROR:
                            return Center(
                              child: Text(
                                'Error occurs during loading courses',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            );
                          default:
                            return SizedBox(
                              height: 48.0,
                              width: 48.0,
                              child: CircularProgressIndicator(),
                            );
                        }
                      }
                      return SizedBox(
                        height: 48.0,
                        width: 48.0,
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Top Rating',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      ElevatedButton(
                        onPressed: () => _viewAll(context, CoursesType.RATE),
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
                  child: StreamBuilder<Response<List<CourseInfo>>>(
                    stream: _rate.courseStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        switch (snapshot.data!.status) {
                          case Status.LOADING:
                            return SizedBox(
                              height: 48.0,
                              width: 48.0,
                              child: CircularProgressIndicator(),
                            );
                          case Status.COMPLETED:
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => CourseCard(
                                info: snapshot.data!.data![index],
                              ),
                              itemCount: snapshot.data!.data!.length,
                            );
                          case Status.ERROR:
                            return Center(
                              child: Text(
                                'Error occurs during loading courses',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            );
                          default:
                            return SizedBox(
                              height: 48.0,
                              width: 48.0,
                              child: CircularProgressIndicator(),
                            );
                        }
                      }
                      return SizedBox(
                        height: 48.0,
                        width: 48.0,
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Top Selling',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      ElevatedButton(
                        onPressed: () => _viewAll(context, CoursesType.SELL),
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
                  child: StreamBuilder<Response<List<CourseInfo>>>(
                    stream: _sell.courseStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        switch (snapshot.data!.status) {
                          case Status.LOADING:
                            return SizedBox(
                              height: 48.0,
                              width: 48.0,
                              child: CircularProgressIndicator(),
                            );
                          case Status.COMPLETED:
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => CourseCard(
                                info: snapshot.data!.data![index],
                              ),
                              itemCount: snapshot.data!.data!.length,
                            );
                          case Status.ERROR:
                            return Center(
                              child: Text(
                                'Error occurs during loading courses',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            );
                          default:
                            return SizedBox(
                              height: 48.0,
                              width: 48.0,
                              child: CircularProgressIndicator(),
                            );
                        }
                      }
                      return SizedBox(
                        height: 48.0,
                        width: 48.0,
                        child: CircularProgressIndicator(),
                      );
                    },
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

  void _popUpMenuHandler(value, context) {
    switch (value) {
      case 'Account':
        Navigator.of(context).pushNamed('/management');
        break;
      case 'Support':
        Navigator.of(context, rootNavigator: true).pushNamed('/support');
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leadingWidth: 0.0,
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/statistic'),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: ClipRRect(
                child: _userProvider.user.avatar != null
                    ? Image.network(_userProvider.user.avatar.toString())
                    : Image(image: AssetImage('assets/default/takodachi.png')),
                borderRadius: BorderRadius.circular(20.0),
              ),
              radius: 16.0,
            ),
          ),
          PopupMenuButton<String>(
            offset: Offset(0.0, 56.0),
            padding: EdgeInsets.zero,
            onSelected: (value) => _popUpMenuHandler(value, context),
            itemBuilder: (context) => [
              PopupMenuItem<String>(
                child: Text('Account'),
                value: 'Account',
              ),
              PopupMenuItem<String>(
                child: Text('Support'),
                value: 'Support',
              )
            ],
          )
        ],
      ),
      body: _buildHomeFragment(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
