import 'package:flutter/material.dart';

// ignore: camel_case_types
class VerticalSpacer extends StatelessWidget {
  final double distance;

  const VerticalSpacer({
    Key? key,
    required this.distance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: distance,
    );
  }
}

// ignore: camel_case_types
class HorizontalSpacer extends StatelessWidget {
  final double distance;

  const HorizontalSpacer({
    Key? key,
    required this.distance,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: distance,
    );
  }
}

// ignore: camel_case_types
class TextSeparator extends StatelessWidget {
  final double distance;

  const TextSeparator({
    Key? key,
    required this.distance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: distance / 2),
      child: Text('\u22C5'),
    );
  }
}
