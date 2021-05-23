import 'package:flutter/material.dart';
import 'package:flutter_app/models/course_info.dart';
import 'package:flutter_app/views/utils/converter.dart';
import 'package:flutter_app/views/utils/spacer.dart';
import 'package:flutter_app/views/components/rating_bar.dart';

class CourseCard extends StatelessWidget {
  final CourseInfo info;

  const CourseCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  _view(context) {
    Navigator.of(context, rootNavigator: true)
        .pushNamed('/course', arguments: info);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _view(context),
      child: Card(
        child: SizedBox(
          width: 256.0,
          height: 256.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 256.0,
                height: 132.0,
                child: Image(
                  image: NetworkImage(info.imageUrl.toString()),
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
                      info.title.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(info.instructorUserName.toString()),
                    Row(children: [
                      Text(OLConverter.date(info.updatedAt.toString(), true)),
                      TextSeparator(distance: 4.0),
                      Text(OLConverter.time(info.totalHours)),
                    ]),
                    Row(
                      children: [
                        RatingBar(
                          stars: 5,
                          rate: (info.contentPoint! +
                                  info.formalityPoint! +
                                  info.presentationPoint!) /
                              3,
                          color: Colors.yellow[600],
                          size: 18.0,
                          reactable: false,
                        ),
                        HorizontalSpacer(distance: 4.0),
                        Text('(${info.ratedNumber})')
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
