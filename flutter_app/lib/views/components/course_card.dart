import 'package:flutter/material.dart';
import 'package:flutter_app/views/components/spaces.dart';
import 'package:flutter_app/views/components/rating_bar.dart';

class CourseCard extends StatelessWidget {
  final ImageProvider<Object> image;
  final String title;
  final String author;
  final String level;
  final String date;
  final String time;
  final double rating;
  final int votes;

  const CourseCard(
      {Key key,
      @required this.image,
      @required this.title,
      @required this.author,
      @required this.level,
      @required this.date,
      @required this.time,
      @required this.rating,
      @required this.votes})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 256.0,
      height: 256.0,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 256.0,
              height: 132.0,
              child: Image(
                image: image,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(author),
                  Row(children: [
                    Text(level),
                    TextSeparator_S(),
                    Text(date),
                    TextSeparator_S(),
                    Text(time),
                  ]),
                  Row(
                    children: [
                      RatingBar(
                        stars: 5,
                        rate: rating,
                        color: Colors.yellow[600],
                        size: 18.0,
                        reactable: false,
                      ),
                      TextSpace_S(),
                      Text('($votes)')
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
