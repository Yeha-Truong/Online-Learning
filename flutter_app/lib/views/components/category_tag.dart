import 'package:flutter/material.dart';
import 'package:flutter_app/views/components/spacer.dart';

class CategoryTag extends StatelessWidget {
  final String title;

  const CategoryTag({
    Key? key,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(44, 49, 55, 1),
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 4.0,
              ),
              child: Icon(
                Icons.check_circle,
                color: Colors.red,
                size: 24.0,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 8.0),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
