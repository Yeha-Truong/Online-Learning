// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_app/views/components/text_style.dart';

class ExpandableText extends StatefulWidget {
  final String content;
  final int lines;
  final TextStyle? style;
  final double? fixedFontSize;
  ExpandableText({
    Key? key,
    required this.content,
    this.style,
    this.lines = 200,
    this.fixedFontSize,
  }) : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool visibility = false;
  GlobalKey _key = GlobalKey();
  double _height = 24.0;

  @override
  void initState() {
    _schedule();
    super.initState();
  }

  _schedule() {
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      _update();
    });
  }

  _update() {
    var _context = _key.currentContext;
    if (_context != null) {
      var box = _context.findRenderObject() as RenderBox;
      setState(() {
        _height = box.size.height;
      });
    }
  }

  void _changeVisibility() {
    setState(() {
      visibility = !visibility;
    });
    _schedule();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          key: _key,
          child: AutoSizeText(
            widget.content,
            style: widget.style,
            overflow: TextOverflow.ellipsis,
            presetFontSizes: widget.fixedFontSize != null
                ? [widget.fixedFontSize!.toDouble()]
                : null,
            maxLines: visibility ? 1000 : widget.lines,
          ),
        ),
        SizedBox(
          height: _height,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(0.0, 0.0),
              padding: EdgeInsets.all(0.0),
              primary: Colors.grey[600],
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: _changeVisibility,
            child: visibility
                ? Icon(Icons.keyboard_arrow_up)
                : Icon(Icons.keyboard_arrow_down),
          ),
        ),
      ],
    );
  }
}
