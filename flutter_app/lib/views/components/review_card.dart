import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/components/rating_bar.dart';
import 'package:flutter_app/views/utils/converter.dart';
import 'package:flutter_app/views/utils/spacer.dart';

class ReviewCard extends StatefulWidget {
  final String name;
  final Widget image;
  final double rate;
  final String review;
  final String date;

  const ReviewCard({
    Key? key,
    required this.name,
    required this.image,
    required this.rate,
    required this.review,
    required this.date,
  }) : super(key: key);

  @override
  _ReviewCardState createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  bool visibility = false;

  _onTap() {
    setState(() {
      visibility = !visibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 4.0,
              right: 4.0,
              top: 4.0,
              bottom: 8.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 64.0,
                  margin: EdgeInsets.only(top: 4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: ClipRRect(
                            child: widget.image,
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          radius: 24.0,
                        ),
                      ),
                      VerticalSpacer(distance: 4.0),
                      AutoSizeText(
                        widget.name,
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                HorizontalSpacer(distance: 12.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RatingBar(
                        color: Colors.yellow,
                        rate: widget.rate,
                        stars: 5,
                        reactable: false,
                        size: 18.0,
                      ),
                      VerticalSpacer(distance: 2.0),
                      AutoSizeText(
                        OLConverter.date(widget.date, false),
                        style: Theme.of(context).textTheme.caption,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      VerticalSpacer(distance: 4.0),
                      AutoSizeText(
                        widget.review,
                        style: Theme.of(context).textTheme.bodyText1,
                        overflow: TextOverflow.ellipsis,
                        presetFontSizes:
                            Theme.of(context).textTheme.bodyText1!.fontSize !=
                                    null
                                ? [
                                    Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .fontSize!
                                        .toDouble()
                                  ]
                                : null,
                        maxLines: visibility ? 1000 : 3,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
    // return ListTile(
    //   isThreeLine: true,
    //   leading: Container(
    //     width: 64.0,
    //     child: Column(
    //       children: [
    //         Container(
    //           child: CircleAvatar(
    //             backgroundColor: Colors.transparent,
    //             child: ClipRRect(
    //               child: widget.image,
    //               borderRadius: BorderRadius.circular(20.0),
    //             ),
    //             radius: 24.0,
    //           ),
    //         ),
    //         Flexible(
    //           child: Text(
    //             widget.name,
    //             style: Theme.of(context).textTheme.bodyText1,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    //   title: RatingBar(
    //     color: Colors.yellow,
    //     rate: widget.rate,
    //     stars: 5,
    //     reactable: false,
    //     size: 18.0,
    //   ),
    //   subtitle: Text(
    //     widget.review,
    //     style: Theme.of(context).textTheme.bodyText1,
    //     maxLines: 4,
    //   ),
    // );
  }
}
