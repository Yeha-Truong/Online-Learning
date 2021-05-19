import 'package:flutter/material.dart';
import 'package:flutter_app/views/components/author_tag.dart';
import 'package:flutter_app/views/components/expandable_text.dart';
import 'package:flutter_app/views/components/lesson_list_tile.dart';
import 'package:flutter_app/views/components/sticky_widget.dart';
import 'package:flutter_app/views/components/rating_bar.dart';
import 'package:flutter_app/views/utils/spacer.dart';
import 'package:flutter_app/views/components/video_player.dart';

class CoursePage extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.startToEnd,
      onDismissed: (_) => Navigator.of(context).pop(),
      key: Key('dismissible'),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            StickyWidget(
              widget: ChewieVideoPlayer(
                url:
                    'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
              ),
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
                          'React: The Big Picture',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        VerticalSpacer(distance: 16.0),
                        AuthorTag(
                          image: AssetImage('assets/default/takodachi.png'),
                          author: 'Cory House',
                        ),
                        VerticalSpacer(distance: 16.0),
                        Row(
                          children: [
                            Text('Beginner',
                                style: Theme.of(context).textTheme.caption),
                            TextSeparator(distance: 4.0),
                            Text(
                              'November 21, 2017',
                              style: Theme.of(context).textTheme.caption,
                            ),
                            TextSeparator(distance: 4.0),
                            Text(
                              '1h 11m',
                              style: Theme.of(context).textTheme.caption,
                            ),
                            HorizontalSpacer(distance: 4.0),
                            RatingBar(
                              color: Colors.yellow[600],
                              rate: 5.0,
                              reactable: false,
                              size: 12.0,
                            ),
                            HorizontalSpacer(distance: 4.0),
                            Text(
                              '(459)',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                        VerticalSpacer(distance: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromRGBO(44, 49, 55, 1),
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.bookmark),
                                    onPressed: () => {},
                                  ),
                                ),
                                VerticalSpacer(distance: 8.0),
                                Text(
                                  'Bookmarked',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromRGBO(44, 49, 55, 1),
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.add_to_queue),
                                    onPressed: () => {},
                                  ),
                                ),
                                VerticalSpacer(distance: 8.0),
                                Text(
                                  'Add to channel',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromRGBO(44, 49, 55, 1),
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.arrow_circle_down_rounded),
                                    onPressed: () => {},
                                  ),
                                ),
                                VerticalSpacer(distance: 8.0),
                                Text(
                                  'Downloaded',
                                  style: Theme.of(context).textTheme.caption,
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
                          content:
                              "Learn React\nPeople come to React from different backgrounds and with different learning styles. Whether you prefer a more theoretical or a practical approach, we hope you’ll find this section helpful.\nIf you prefer to learn by doing, start with our practical tutorial.\nIf you prefer to learn concepts step by step, start with our guide to main concepts.\nLike any unfamiliar technology, React does have a learning curve. With practice and some patience, you will get the hang of it.\nFirst Examples\nThe React homepage contains a few small React examples with a live editor. Even if you don’t know anything about React yet, try changing their code and see how it affects the result.\nReact for Beginners\nIf you feel that the React documentation goes at a faster pace than you’re comfortable with, check out this overview of React by Tania Rascia. It introduces the most important React concepts in a detailed, beginner-friendly way. Once you’re done, give the documentation another try!\nReact for Designers\nIf you’re coming from a design background, these resources are a great place to get started.\nJavaScript Resources\nThe React documentation assumes some familiarity with programming in the JavaScript language. You don’t have to be an expert, but it’s harder to learn both React and JavaScript at the same time.\nWe recommend going through this JavaScript overview to check your knowledge level. It will take you between 30 minutes and an hour but you will feel more confident learning React.",
                          style: Theme.of(context).textTheme.bodyText1,
                          lines: 2,
                          fixedFontSize: 14.0,
                        ),
                        VerticalSpacer(distance: 8.0),
                        FractionallySizedBox(
                          widthFactor: 1.0,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(44, 49, 55, 1),
                            ),
                            onPressed: () => {},
                            icon: Icon(Icons.subscriptions_outlined),
                            label: Text('Related paths & courses'),
                          ),
                        ),
                        FractionallySizedBox(
                          widthFactor: 1.0,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(44, 49, 55, 1),
                            ),
                            onPressed: () => {},
                            icon: Icon(Icons.check_circle_outlined),
                            label: Text('Take a learning check'),
                          ),
                        ),
                        FractionallySizedBox(
                          widthFactor: 1.0,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(44, 49, 55, 1),
                            ),
                            onPressed: () =>
                                Navigator.pushNamed(context, '/review'),
                            icon: Icon(Icons.rate_review_outlined),
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
                          MediaQuery.of(context).size.width * 9 / 16,
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
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Transcript',
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _tabController,
                              children: <Widget>[
                                Container(
                                  child: ListView.separated(
                                      itemBuilder: (context, index) =>
                                          LessonListTile(
                                            id: "89008555-af76-4ad3-8f98-36e4d8704344",
                                            title:
                                                "Giới thiệu tổng quát custom hooks (2020) 🚀",
                                            url:
                                                "https://youtube.com/embed/8Ee__cUapdg",
                                            time: 0.18,
                                            order: 1,
                                            isPreview: false,
                                            isPublic: true,
                                            isDeleted: false,
                                          ),
                                      separatorBuilder: (context, index) =>
                                          Divider(),
                                      itemCount: 12),
                                ),
                                Container(
                                  height: 200.0,
                                  child: Center(
                                    child: Text(
                                      'Editor Choice',
                                      style:
                                          Theme.of(context).textTheme.subtitle2,
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
        ),
      ),
    );
  }
}
