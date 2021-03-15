import 'package:flutter/material.dart';

// ignore: camel_case_types
class VerticalSpace_S extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.0,
    );
  }
}

// ignore: camel_case_types
class VerticalSpace_M extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16.0,
    );
  }
}

// ignore: camel_case_types
class TextSeparator_S extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      child: Text('\u22C5'),
    );
  }
}

// ignore: camel_case_types
class TextSpace_S extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 4.0,
    );
  }
}
