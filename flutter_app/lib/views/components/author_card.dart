import 'package:flutter/material.dart';

class AuthorCard extends StatelessWidget {
  final ImageProvider<Object> image;
  final String author;

  const AuthorCard({
    Key? key,
    required this.image,
    required this.author,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        width: 96.0,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 96.0,
              width: 96.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: image,
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              author,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
