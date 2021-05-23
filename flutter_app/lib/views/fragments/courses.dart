import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_app/models/course_info.dart';
import 'package:flutter_app/networking/blocs/blocs.dart';
import 'package:flutter_app/networking/repository/courses_repository.dart';
import 'package:flutter_app/networking/response.dart';
import 'package:flutter_app/views/components/course_tile.dart';

class CourseListFragment extends StatefulWidget {
  @override
  _CourseListFragmentState createState() => _CourseListFragmentState();
}

class _CourseListFragmentState extends State<CourseListFragment> {
  late CoursesType _type;
  late CoursesBloc _bloc;
  late String _title;

  List<CourseInfo> _courses = [];
  int _page = 1;
  int _offset = 10;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _bloc = CoursesBloc();
  }

  @override
  void didChangeDependencies() {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      _type = ModalRoute.of(context)!.settings.arguments as CoursesType;
      _bloc.topCourses(_type, _offset, _page);
      switch (_type) {
        case CoursesType.NEW:
          _title = 'New';
          break;
        case CoursesType.RATE:
          _title = 'Top Rate';
          break;
        case CoursesType.SELL:
          _title = 'Top Selling';
          break;
        default:
          _title = '';
          break;
      }
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
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
                  Text('Home'),
                ],
              ),
              onTap: () => Navigator.pop(context),
            ),
          ),
        ),
        leadingWidth: 150.0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (!_loading &&
                      notification.metrics.pixels ==
                          notification.metrics.maxScrollExtent) {
                    _bloc = CoursesBloc();
                    _bloc.topCourses(_type, _offset, _page);

                    setState(() {
                      _loading = true;
                    });
                  }
                  return true;
                },
                child: ListView.separated(
                  itemBuilder: (context, index) => CourseTile(
                    info: _courses[index],
                  ),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: _courses.length,
                ),
              ),
            ),
            StreamBuilder<Response<List<CourseInfo>>>(
              stream: _bloc.courseStream,
              builder: (context, snapshot) {
                if (snapshot.hasData)
                  switch (snapshot.data!.status) {
                    case Status.LOADING:
                      return Container(
                        margin: EdgeInsets.all(4.0),
                        child: CircularProgressIndicator(),
                      );
                    case Status.COMPLETED:
                      if (_loading && snapshot.data!.data!.isNotEmpty) {
                        _courses = _courses + snapshot.data!.data!.toList();
                        _page += 1;
                        _loading = false;
                      }
                      SchedulerBinding.instance!.addPostFrameCallback((_) {
                        setState(() {});
                      });
                      return Container();
                    case Status.ERROR:
                      return Container();
                    default:
                      return Container(
                        margin: EdgeInsets.all(4.0),
                        child: CircularProgressIndicator(),
                      );
                  }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
