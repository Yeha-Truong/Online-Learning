import 'package:flutter/material.dart';
import 'package:flutter_app/views/components/spaces.dart';
import 'package:flutter_app/views/components/text_style.dart';

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
              color: Colors.grey[600],
              borderRadius: BorderRadius.all(Radius.circular(18.0))),
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
              TextSpace_S(),
              Container(
                margin: EdgeInsets.only(right: 8.0),
                child: Text(
                  author,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyle().TextStyle_S(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
