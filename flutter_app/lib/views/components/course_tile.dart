import 'package:flutter/material.dart';
import 'package:flutter_app/models/course_info.dart';
import 'package:flutter_app/views/utils/converter.dart';
import 'package:flutter_app/views/utils/spacer.dart';
import 'package:flutter_app/views/components/rating_bar.dart';

class CourseTile extends StatelessWidget {
  final CourseInfo info;

  const CourseTile({
    Key? key,
    required this.info,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 64.0,
        height: 48.0,
        child: Image(
          image: NetworkImage(info.imageUrl.toString()),
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
            info.title.toString(),
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Text(
            info.instructorUserName.toString(),
            style: Theme.of(context).textTheme.caption,
          ),
          Row(
            children: [
              Text(
                OLConverter.date(info.updatedAt, true),
                style: Theme.of(context).textTheme.caption,
              ),
              TextSeparator(distance: 4.0),
              Text(
                OLConverter.time(info.totalHours),
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
          Row(
            children: [
              RatingBar(
                stars: 5,
                rate: (info.presentationPoint! +
                        info.contentPoint! +
                        info.formalityPoint!) /
                    3,
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
