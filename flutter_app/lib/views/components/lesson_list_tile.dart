import 'package:flutter/material.dart';
import 'package:flutter_app/views/components/spacer.dart';

// ignore: must_be_immutable
class LessonListTile extends StatefulWidget {
  final String id;
  final double order;
  final String url;
  final String title;
  final double time;
  final bool isPreview;
  final bool isPublic;
  final bool isDeleted;
  bool isDone;

  bool isFocus;
  double progress;

  LessonListTile({
    required this.id,
    required this.title,
    required this.url,
    required this.time,
    required this.order,
    required this.isPreview,
    required this.isPublic,
    required this.isDeleted,
    this.isDone = false,
    this.isFocus = false,
    this.progress = 0,
  });

  @override
  _LessonListTileState createState() => _LessonListTileState();
}

class _LessonListTileState extends State<LessonListTile> {
  void _onTap() {
    setState(() {
      widget.isFocus = !widget.isFocus;
    });
  }

  Widget _build() {
    if (widget.isFocus)
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: _onTap,
            dense: true,
            leading: SizedBox(
              width: 18.0,
              child: Align(
                  child: Icon(
                    Icons.check_circle_outline,
                    size: 18.0,
                    color: widget.isDone ? Colors.green : null,
                  ),
                  alignment: Alignment.center),
            ),
            title: Align(
              child: Container(
                child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              alignment: Alignment(-2.5, 0.0),
            ),
          ),
          Divider(),
          ListTile(
            dense: true,
            leading: SizedBox(
              width: 96.0,
              height: 54.0,
              child: Image(
                image: AssetImage('assets/default/takodachi.png'),
                fit: BoxFit.fill,
              ),
            ),
            title: Align(
              child: Container(
                child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              alignment: Alignment(0, 0.0),
            ),
            subtitle: Text(
              Duration(seconds: (widget.time * 3600).toInt())
                  .toString()
                  .split('.')[0],
              style: Theme.of(context).textTheme.bodyText1,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  child: Icon(
                    Icons.arrow_circle_down,
                    size: 18.0,
                    color: Colors.white,
                  ),
                  onTap: () => {},
                ),
                HorizontalSpacer(distance: 4.0),
                InkWell(
                  child: Icon(
                    Icons.more_horiz_rounded,
                    size: 18.0,
                  ),
                  onTap: () => {},
                ),
              ],
            ),
          ),
        ],
      );
    else
      return ListTile(
        onTap: _onTap,
        dense: true,
        leading: SizedBox(
          width: 18.0,
          child: Align(
              child: Icon(
                Icons.check_circle_outline,
                size: 18.0,
                color: widget.isDone ? Colors.green : null,
              ),
              alignment: Alignment.center),
        ),
        title: Align(
          child: Container(
            child: Text(
              widget.title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          alignment: Alignment(-2.5, 0.0),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return _build();
  }
}
