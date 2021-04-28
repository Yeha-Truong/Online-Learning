import 'package:flutter/material.dart';
import 'package:flutter_app/views/components/author_tag.dart';
import 'package:flutter_app/views/components/expandable_text.dart';
import 'package:flutter_app/views/components/lesson_list_tile.dart';
import 'package:flutter_app/views/components/sticky_widget.dart';
import 'package:flutter_app/views/components/rating_bar.dart';
import 'package:flutter_app/views/components/spaces.dart';
import 'package:flutter_app/views/components/video_player.dart';
import 'package:flutter_app/views/components/text_style.dart';

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
    return Scaffold(
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
                        style: CustomTextStyle().TextStyle_L_B(),
                      ),
                      VerticalSpace_M(),
                      AuthorTag(
                        image: AssetImage('assets/default/takodachi.png'),
                        author: 'Cory House',
                      ),
                      VerticalSpace_M(),
                      Row(
                        children: [
                          Text(
                            'Beginner',
                            style: CustomTextStyle().TextStyle_S(),
                          ),
                          TextSeparator_S(),
                          Text(
                            'November 21, 2017',
                            style: CustomTextStyle().TextStyle_S(),
                          ),
                          TextSeparator_S(),
                          Text(
                            '1h 11m',
                            style: CustomTextStyle().TextStyle_S(),
                          ),
                          TextSpace_S(),
                          RatingBar(
                            color: Colors.yellow[600],
                            rate: 5.0,
                            reactable: false,
                            size: 12.0,
                          ),
                          TextSpace_S(),
                          Text(
                            '(459)',
                            style: CustomTextStyle().TextStyle_S(),
                          ),
                        ],
                      ),
                      VerticalSpace_M(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[600],
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.bookmark),
                                  onPressed: () => {},
                                ),
                              ),
                              VerticalSpace_S(),
                              Text(
                                'Bookmarked',
                                style: CustomTextStyle().TextStyle_S(),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[600],
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.add_to_queue),
                                  onPressed: () => {},
                                ),
                              ),
                              VerticalSpace_S(),
                              Text(
                                'Add to channel',
                                style: CustomTextStyle().TextStyle_S(),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[600],
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.arrow_circle_down_rounded),
                                  onPressed: () => {},
                                ),
                              ),
                              VerticalSpace_S(),
                              Text(
                                'Downloaded',
                                style: CustomTextStyle().TextStyle_S(),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1.0,
                      ),
                      VerticalSpace_S(),
                      ExpandableText(
                        content:
                            "You've heard of React, but is it right for you? In this course, React: The Big Picture, you will first learn why React has become so popular. Next, you will",
                        style: CustomTextStyle().TextStyle_M(),
                        lines: 2,
                        fixedFontSize: 14.0,
                      ),
                      VerticalSpace_S(),
                      FractionallySizedBox(
                        widthFactor: 1.0,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey[600],
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
                            primary: Colors.grey[600],
                          ),
                          onPressed: () => {},
                          icon: Icon(Icons.check_circle_outlined),
                          label: Text('Take a learning check'),
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
                    child: Scaffold(
                      appBar: AppBar(
                        title: TabBar(
                          controller: _tabController,
                          tabs: <Widget>[
                            Tab(
                              child: Text('Contents'),
                            ),
                            Tab(
                              child: Text('Transcript'),
                            ),
                          ],
                        ),
                      ),
                      body: TabBarView(
                        controller: _tabController,
                        children: <Widget>[
                          Container(
                            child: ListView.separated(
                                itemBuilder: (context, index) => LessonListTile(
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
                                separatorBuilder: (context, index) => Divider(),
                                itemCount: 12),
                          ),
                          Container(
                            height: 200.0,
                            child: Center(child: Text('Editor Choice')),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
