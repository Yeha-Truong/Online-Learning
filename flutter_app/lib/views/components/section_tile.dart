import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/components/lesson_tile.dart';

// ignore: must_be_immutable
class SectionTile extends StatefulWidget {
  final Section section;
  bool isFocus;

  SectionTile({
    required this.section,
    this.isFocus = false,
  });

  @override
  _SectionTileState createState() => _SectionTileState();
}

class _SectionTileState extends State<SectionTile> {
  void _onTap() {
    setState(() {
      widget.isFocus = !widget.isFocus;
    });
  }

  Widget _build() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          onTap: _onTap,
          dense: true,
          title: Text(
            widget.section.name.toString(),
            style: Theme.of(context).textTheme.subtitle2,
          ),
          trailing: Text(
              Duration(seconds: (widget.section.sumHours! * 3600).toInt())
                  .toString()
                  .split('.')[0],
              style: Theme.of(context).textTheme.subtitle2),
        ),
        Divider(),
        if (widget.isFocus)
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) =>
                LessonTile(lesson: widget.section.lesson![index]),
            itemCount: widget.section.lesson!.length,
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _build();
  }
}
