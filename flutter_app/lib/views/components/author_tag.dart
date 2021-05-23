import 'package:flutter/material.dart';
import 'package:flutter_app/views/utils/spacer.dart';

class AuthorTag extends StatelessWidget {
  final ImageProvider<Object> image;
  final String author;

  const AuthorTag({
    Key? key,
    required this.image,
    required this.author,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(44, 49, 55, 1),
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.all(2.0),
                height: 24.0,
                width: 24.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: image,
                  ),
                ),
              ),
              HorizontalSpacer(distance: 4.0),
              Container(
                margin: EdgeInsets.only(right: 8.0),
                child: Text(
                  author,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
