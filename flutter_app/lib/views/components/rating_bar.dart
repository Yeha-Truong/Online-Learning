import 'package:flutter/material.dart';

//ignore: must_be_immutable
class RatingBar extends StatefulWidget {
  final int stars;
  double rate;
  final bool reactable;
  final Color? color;
  final double size;

  RatingBar(
      {Key? key,
      this.stars = 5,
      this.rate = 0.0,
      this.reactable = true,
      this.color,
      this.size = 24.0})
      : super(key: key);

  @override
  _RatingBarState createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  Widget buildStars(BuildContext context, int index) {
    Icon icon;
    if (index >= widget.rate) {
      icon = new Icon(
        Icons.star_border,
        color: Theme.of(context).buttonColor,
        size: widget.size,
      );
    } else if (index > widget.rate - 1 && index < widget.rate) {
      icon = new Icon(
        Icons.star_half,
        color: widget.color ?? Theme.of(context).primaryColor,
        size: widget.size,
      );
    } else {
      icon = new Icon(
        Icons.star,
        color: widget.color ?? Theme.of(context).primaryColor,
        size: widget.size,
      );
    }
    return new InkResponse(
      onTap: widget.reactable
          ? () => {
                setState(() {
                  widget.rate = index + 1.0;
                })
              }
          : null,
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
        children: new List.generate(
            widget.stars, (index) => buildStars(context, index)));
  }
}
