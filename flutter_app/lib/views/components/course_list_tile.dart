import 'package:flutter/material.dart';
import 'package:flutter_app/views/utils/spacer.dart';
import 'package:flutter_app/views/components/rating_bar.dart';

class CourseListTile extends StatelessWidget {
  final ImageProvider<Object> image;
  final String title;
  final String author;
  final String level;
  final String date;
  final String time;
  final double rating;

  const CourseListTile(
      {Key? key,
      required this.image,
      required this.title,
      required this.author,
      required this.level,
      required this.date,
      required this.time,
      required this.rating})
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
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Text(
            author,
            style: Theme.of(context).textTheme.caption,
          ),
          Row(
            children: [
              Text(
                level,
                style: Theme.of(context).textTheme.caption,
              ),
              TextSeparator(distance: 4.0),
              Text(
                date,
                style: Theme.of(context).textTheme.caption,
              ),
              TextSeparator(distance: 4.0),
              Text(
                time,
                style: Theme.of(context).textTheme.caption,
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
      ),
    );
  }
}
