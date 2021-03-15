import 'package:flutter/material.dart';
import 'package:flutter_app/views/components/spaces.dart';
import 'package:flutter_app/views/components/rating_bar.dart';
import 'package:flutter_app/views/components/text_style.dart';

class CourseListTile extends StatelessWidget {
  final ImageProvider<Object> image;
  final String title;
  final String author;
  final String level;
  final String date;
  final String time;
  final double rating;

  const CourseListTile(
      {Key key,
      @required this.image,
      @required this.title,
      @required this.author,
      @required this.level,
      @required this.date,
      @required this.time,
      @required this.rating})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 64.0,
        height: 48.0,
        child: Image(
          image: image,
          fit: BoxFit.fill,
        ),
      ),
      trailing: IconButton(
        alignment: Alignment.topCenter,
        icon: Icon(Icons.more_horiz),
        onPressed: () => {},
      ),
      title: Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            author,
            style: CustomTextStyle().TextStyle_S(),
          ),
          Row(
            children: [
              Text(
                level,
                style: CustomTextStyle().TextStyle_S(),
              ),
              TextSeparator_S(),
              Text(
                date,
                style: CustomTextStyle().TextStyle_S(),
              ),
              TextSeparator_S(),
              Text(
                time,
                style: CustomTextStyle().TextStyle_S(),
              ),
            ],
          ),
          Row(
            children: [
              RatingBar(
                stars: 5,
                rate: rating,
                reactable: false,
                size: 18.0,
                color: Colors.yellow[800],
              ),
            ],
          ),
        ],
      )),
    );
  }
}
