import 'package:flutter/material.dart';
import 'package:flutter_app/views/components/category_tag.dart';
import 'package:flutter_app/views/components/spacer.dart';

class StatisticPage extends StatefulWidget {
  @override
  _StatisticPageState createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  List<String> _interests = ['Javascript', 'Python', 'React'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Align(
          alignment: Alignment.centerLeft,
          child: Container(
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
        leadingWidth: 400.0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 32.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/default/takodachi.png'),
                      radius: 80.0,
                    ),
                    VerticalSpacer(distance: 16.0),
                    Text(
                      'Hai Pham',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ),
            ),
            VerticalSpacer(distance: 32.0),
            Container(
              margin: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Interests',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  VerticalSpacer(distance: 8.0),
                  Container(
                    height: 36.0,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        child: CategoryTag(title: _interests[index]),
                        margin: EdgeInsets.all(2.0),
                      ),
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: _interests.length,
                    ),
                  ),
                  VerticalSpacer(distance: 24.0),
                  Text(
                    'Activity insights (last 30 days)',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  VerticalSpacer(distance: 16.0),
                  Text(
                    'TOTAL ACTIVE DAYS',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  VerticalSpacer(distance: 8.0),
                  Row(
                    children: [
                      Text(
                        '4',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Text(
                        '1 day streak',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  VerticalSpacer(distance: 16.0),
                  Text(
                    'MOST ACTIVE TIME OF DAY',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  VerticalSpacer(distance: 8.0),
                  Text(
                    '21:00',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  VerticalSpacer(distance: 16.0),
                  Text(
                    'MOST VIEWED SUBJECT',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  VerticalSpacer(distance: 8.0),
                  Text(
                    'Managerial Skills',
                    style: Theme.of(context).textTheme.headline5,
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
