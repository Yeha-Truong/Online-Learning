import 'package:flutter/material.dart';
import 'package:flutter_app/views/utils/spacer.dart';

class RatingPercentageBar extends StatelessWidget {
  final double value;
  final double percent;

  const RatingPercentageBar({
    Key? key,
    required this.value,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            value.toString(),
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: 20.0,
          ),
          HorizontalSpacer(distance: 8.0),
          Expanded(
            child: LinearProgressIndicator(
              value: percent,
              minHeight: 10.0,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
            ),
          )
        ],
      ),
    );
  }
}
