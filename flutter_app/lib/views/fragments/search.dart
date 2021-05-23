import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_app/models/course_info.dart';
import 'package:flutter_app/models/instructor.dart';
import 'package:flutter_app/networking/blocs/blocs.dart';
import 'package:flutter_app/networking/response.dart';
import 'package:flutter_app/views/components/course_tile.dart';
import 'package:flutter_app/views/utils/messages.dart';

class SearchFragment extends StatefulWidget {
  @override
  _SearchFragmentState createState() => _SearchFragmentState();
}

class _SearchFragmentState extends State<SearchFragment>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late TabController _tabController;
  late SearchBloc _bloc;
  TextEditingController _form = TextEditingController();
  List<CourseInfo> _courses = [];
  List<Instructor> _instructors = [];

  bool _cempty = false;
  bool _iempty = false;
  int _offset = 1;
  bool _loading = false;
  String _keyword = '';

  void _search(context) {
    _loading = true;
    if (_form.text.isNotEmpty) {
      _keyword = _form.text;
      _bloc = SearchBloc();
      _bloc.courses(_keyword, _offset, []);
      _bloc.stream.listen((event) {
        switch (event.status) {
          case Status.LOADING:
            break;
          case Status.COMPLETED:
            if (_loading &&
                (event.data!['courses']['data'].isNotEmpty ||
                    event.data!['instructors']['data'].isNotEmpty)) {
              List<CourseInfo>? courses = (event.data!['courses']['data']
                      as List<dynamic>?)
                  ?.map((e) => CourseInfo.fromJson(e as Map<String, dynamic>))
                  .toList();
              if (courses != null) {
                _courses = _courses + courses;
                _cempty = false;
              }

              List<Instructor>? instructors = (event.data!['instructors']
                      ['data'] as List<dynamic>?)
                  ?.map((e) => Instructor.fromJson(e as Map<String, dynamic>))
                  .toList();
              if (instructors != null) {
                _instructors = _instructors + instructors;
                _iempty = false;
              }

              _offset += 1;
            }
            if (_courses.isEmpty) _cempty = true;
            if (_instructors.isEmpty) _iempty = true;

            _loading = false;
            setState(() {});
            break;
          case Status.ERROR:
            _loading = false;
            OLMessage.showSnackBarMessge(context, event.message.toString());
            break;
          default:
            break;
        }
      });
    }
  }

  void _more(context) {
    if (_keyword.isNotEmpty) {
      _bloc = SearchBloc();
      _bloc.courses(_keyword, _offset, []);
      _bloc.stream.listen((event) {
        switch (event.status) {
          case Status.LOADING:
            break;
          case Status.COMPLETED:
            if (_loading &&
                (event.data!['courses']['data'].isNotEmpty ||
                    event.data!['instructors']['data'].isNotEmpty)) {
              List<CourseInfo>? courses = (event.data!['courses']['data']
                      as List<dynamic>?)
                  ?.map((e) => CourseInfo.fromJson(e as Map<String, dynamic>))
                  .toList();
              if (courses != null) {
                _courses = _courses + courses;
                _cempty = false;
              }

              List<Instructor>? instructors = (event.data!['instructors']
                      ['data'] as List<dynamic>?)
                  ?.map((e) => Instructor.fromJson(e as Map<String, dynamic>))
                  .toList();
              if (instructors != null) {
                _instructors = _instructors + instructors;
                _iempty = false;
              }

              _offset += 1;
            }
            if (_courses.isEmpty) _cempty = true;
            if (_instructors.isEmpty) _iempty = true;

            _loading = false;
            setState(() {});
            break;
          case Status.ERROR:
            _loading = false;
            OLMessage.showSnackBarMessge(context, event.message.toString());
            break;
          default:
            break;
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 2,
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (!_loading &&
              notification.metrics.pixels ==
                  notification.metrics.maxScrollExtent) {
            _more(context);

            setState(() {
              _loading = true;
            });
          }
          return true;
        },
        child: CustomScrollView(slivers: [
          SliverAppBar(
            floating: true,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 24.0,
              ),
              child: Stack(alignment: Alignment.topLeft, children: [
                TextFormField(
                  controller: _form,
                  maxLines: 1,
                  onFieldSubmitted: (keywords) => _search(context),
                  onChanged: (value) {
                    setState(() {
                      _courses.clear();
                      _instructors.clear();
                      _cempty = false;
                      _iempty = false;
                      _offset = 1;
                    });
                  },
                  autofocus: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
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
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: GestureDetector(
                    dragStartBehavior: DragStartBehavior.down,
                    onTap: () => _search(context),
                    child: Icon(Icons.search),
                  ),
                ),
              ]),
            ),
            bottom: TabBar(
              controller: _tabController,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    'Courses',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
                Tab(
                  child: Text(
                    'Instructors',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Stack(
                    children: [
                      if (_form.text.isEmpty)
                        Center(
                          child: Text(
                            'Thousands courses at your fingertips',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ),
                      if (_cempty)
                        Center(
                          child: Text(
                            'No course found',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ),
                      if (_courses.isNotEmpty)
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: ListView.separated(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) =>
                                      CourseTile(info: _courses[index]),
                                  separatorBuilder: (context, index) =>
                                      Divider(),
                                  itemCount: _courses.length),
                            ),
                            if (_loading) CircularProgressIndicator()
                          ],
                        ),
                    ],
                  ),
                  Stack(children: [
                    if (_form.text.isEmpty)
                      Center(
                        child: Text(
                          'Hundreds instructors waiting for you',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    if (_iempty)
                      Center(
                        child: Text(
                          'No instructor found',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    if (_instructors.isNotEmpty)
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) =>
                                    CourseTile(info: _courses[index]),
                                separatorBuilder: (context, index) => Divider(),
                                itemCount: _courses.length),
                          ),
                          if (_loading) CircularProgressIndicator(),
                        ],
                      ),
                  ]),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
