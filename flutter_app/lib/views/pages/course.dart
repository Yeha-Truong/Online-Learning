import 'package:flutter/material.dart';
import 'package:flutter_app/models/course_detail.dart';
import 'package:flutter_app/models/course_info.dart';
import 'package:flutter_app/models/lesson.dart';
import 'package:flutter_app/networking/blocs/blocs.dart';
import 'package:flutter_app/networking/response.dart';
import 'package:flutter_app/views/components/author_tag.dart';
import 'package:flutter_app/views/components/expandable_text.dart';
import 'package:flutter_app/views/components/section_tile.dart';
import 'package:flutter_app/views/components/sticky_widget.dart';
import 'package:flutter_app/views/components/rating_bar.dart';
import 'package:flutter_app/views/components/youtube_video_player..dart';
import 'package:flutter_app/views/utils/converter.dart';
import 'package:flutter_app/views/utils/spacer.dart';
import 'package:flutter_app/views/components/chewie_video_player.dart';

class CoursePage extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();

  static _CoursePageState? of(BuildContext context) =>
      context.findAncestorStateOfType<_CoursePageState>();
}

class _CoursePageState extends State<CoursePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late CourseBloc _courseBloc;
  late CourseDetail _detail;

  CourseInfo? _info;
  Lesson? _lesson;

  set lesson(value) {
    setState(() {
      _lesson = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
    _courseBloc = new CourseBloc();
  }

  @override
  void didChangeDependencies() {
    if (ModalRoute.of(context)!.settings.arguments != null && _info == null) {
      _info = ModalRoute.of(context)!.settings.arguments as CourseInfo;
      _courseBloc.getDetails(_info!.id.toString());
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.startToEnd,
      onDismissed: (_) => Navigator.of(context).pop(),
      key: Key('dismissible'),
      child: Scaffold(
        body: StreamBuilder<Response<CourseDetail>>(
            stream: _courseBloc.courseStream,
            builder: (context, snapshot) {
              if (snapshot.hasData)
                switch (snapshot.data!.status) {
                  case Status.LOADING:
                    return Center(child: CircularProgressIndicator());
                  case Status.COMPLETED:
                    _detail = snapshot.data!.data!;
                    return CustomScrollView(
                      slivers: [
                        StickyWidget(
                          widget: _lesson == null
                              ? (_detail.promoVidUrl != null
                                  ? (_detail.promoVidUrl!.contains('.mp4')
                                      ? ChewieVideoPlayer(
                                          url: _detail.promoVidUrl.toString())
                                      : YoutubeVideoPlayer(
                                          url: _detail.promoVidUrl.toString(),
                                        ))
                                  : Image.network(
                                      _detail.imageUrl.toString(),
                                    ))
                              : (_lesson!.videoUrl!.contains('.mp4')
                                  ? ChewieVideoPlayer(url: _lesson!.videoUrl!)
                                  : YoutubeVideoPlayer(
                                      url: _lesson!.videoUrl!,
                                    )),
                          minHeight: MediaQuery.of(context).size.width * 9 / 16,
                          maxHeight: MediaQuery.of(context).size.width * 9 / 16,
                        ),
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              Container(
                                margin: EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      _detail.title.toString(),
                                      style:
                                          Theme.of(context).textTheme.subtitle2,
                                    ),
                                    VerticalSpacer(distance: 4.0),
                                    Text(_detail.subtitle.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption),
                                    VerticalSpacer(distance: 16.0),
                                    AuthorTag(
                                      image: NetworkImage(_detail
                                          .instructor!.avatar
                                          .toString()),
                                      author:
                                          _detail.instructor!.name.toString(),
                                    ),
                                    VerticalSpacer(distance: 16.0),
                                    Row(
                                      children: [
                                        Text(
                                          OLConverter.date(
                                                  _detail.updatedAt, false)
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption,
                                        ),
                                        TextSeparator(distance: 4.0),
                                        Text(
                                          OLConverter.time(_detail.totalHours),
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption,
                                        ),
                                        HorizontalSpacer(distance: 4.0),
                                        RatingBar(
                                          color: Colors.yellow[600],
                                          rate: double.parse(
                                              _detail.averagePoint.toString()),
                                          reactable: false,
                                          size: 12.0,
                                        ),
                                        HorizontalSpacer(distance: 4.0),
                                        Text(
                                          "(${_detail.ratedNumber.toString()})",
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption,
                                        ),
                                      ],
                                    ),
                                    VerticalSpacer(distance: 16.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color.fromRGBO(
                                                    44, 49, 55, 1),
                                              ),
                                              child: IconButton(
                                                icon: Icon(Icons
                                                    .favorite_border_rounded),
                                                onPressed: () => {},
                                              ),
                                            ),
                                            VerticalSpacer(distance: 8.0),
                                            Text(
                                              'Add to Favorites',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color.fromRGBO(
                                                    44, 49, 55, 1),
                                              ),
                                              child: IconButton(
                                                icon: Icon(Icons.share),
                                                onPressed: () => {},
                                              ),
                                            ),
                                            VerticalSpacer(distance: 8.0),
                                            Text(
                                              'Share course',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color.fromRGBO(
                                                    44, 49, 55, 1),
                                              ),
                                              child: IconButton(
                                                icon: Icon(Icons
                                                    .arrow_circle_down_rounded),
                                                onPressed: () => {},
                                              ),
                                            ),
                                            VerticalSpacer(distance: 8.0),
                                            Text(
                                              'Downloaded',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 1.0,
                                    ),
                                    VerticalSpacer(distance: 8.0),
                                    ExpandableText(
                                      content: _detail.description.toString(),
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                      lines: 3,
                                      fixedFontSize: 14.0,
                                    ),
                                    VerticalSpacer(distance: 8.0),
                                    FractionallySizedBox(
                                      widthFactor: 1.0,
                                      child: ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          primary:
                                              Color.fromRGBO(44, 49, 55, 1),
                                        ),
                                        onPressed: () => {},
                                        icon:
                                            Icon(Icons.subscriptions_outlined),
                                        label: Text('Related paths & courses'),
                                      ),
                                    ),
                                    FractionallySizedBox(
                                      widthFactor: 1.0,
                                      child: ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          primary:
                                              Color.fromRGBO(44, 49, 55, 1),
                                        ),
                                        onPressed: () => {},
                                        icon: Icon(Icons.check_circle_outlined),
                                        label: Text('Take a learning check'),
                                      ),
                                    ),
                                    if (_detail.ratings != null)
                                      FractionallySizedBox(
                                        widthFactor: 1.0,
                                        child: ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                            primary:
                                                Color.fromRGBO(44, 49, 55, 1),
                                          ),
                                          onPressed: () => Navigator.pushNamed(
                                              context, '/review',
                                              arguments: _detail),
                                          icon:
                                              Icon(Icons.rate_review_outlined),
                                          label: Text('Course reviews'),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              DefaultTabController(
                                length: 2,
                                child: Container(
                                  height: MediaQuery.of(context).size.height -
                                      MediaQuery.of(context).size.width *
                                          9 /
                                          16,
                                  child: Column(
                                    children: [
                                      Container(
                                        color: Color.fromRGBO(44, 49, 55, 1),
                                        child: TabBar(
                                          controller: _tabController,
                                          tabs: <Widget>[
                                            Tab(
                                              child: Text(
                                                'Contents',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle2,
                                              ),
                                            ),
                                            Tab(
                                              child: Text(
                                                'Transcript',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: TabBarView(
                                          controller: _tabController,
                                          children: <Widget>[
                                            _detail.section != null
                                                ? Container(
                                                    child: ListView.separated(
                                                        itemBuilder: (context,
                                                                index) =>
                                                            SectionTile(
                                                                section:
                                                                    _detail.section![
                                                                        index]),
                                                        separatorBuilder:
                                                            (context, index) =>
                                                                Divider(),
                                                        itemCount: _detail
                                                            .section!.length),
                                                  )
                                                : Container(
                                                    height: 200.0,
                                                    child: Center(
                                                      child: Text(
                                                        'Buy course to unlock',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle2,
                                                      ),
                                                    ),
                                                  ),
                                            _lesson == null
                                                ? Container(
                                                    height: 200.0,
                                                    child: Center(
                                                      child: Text(
                                                        'Empty',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle2,
                                                      ),
                                                    ),
                                                  )
                                                : _lesson!.content != null
                                                    ? Container(
                                                        margin:
                                                            EdgeInsets.all(8.0),
                                                        child: Text(
                                                          _lesson!.content
                                                              .toString(),
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText1,
                                                        ),
                                                      )
                                                    : Container(
                                                        height: 200.0,
                                                        child: Center(
                                                          child: Text(
                                                            'Empty',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .subtitle2,
                                                          ),
                                                        ),
                                                      ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  case Status.ERROR:
                    return Center(
                      child: Text(
                          'Error occurs durring loading course!\nSwipe right to go back.',
                          style: Theme.of(context).textTheme.subtitle1),
                    );
                  default:
                    return CircularProgressIndicator();
                }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
