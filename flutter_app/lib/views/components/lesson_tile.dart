import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/components/thumbnail.dart';
import 'package:flutter_app/views/pages/course.dart';
import 'package:flutter_app/views/utils/spacer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ignore: must_be_immutable
class LessonTile extends StatefulWidget {
  Lesson lesson;
  bool isDone;

  bool isFocus;
  double progress;

  LessonTile({
    required this.lesson,
    this.isDone = false,
    this.isFocus = false,
    this.progress = 0,
  });

  @override
  _LessonTileState createState() => _LessonTileState();
}

class _LessonTileState extends State<LessonTile> {
  String? _directory;

  @override
  void initState() {
    super.initState();
  }

  _initialize() async {
    var directory = await getTemporaryDirectory();
    _directory = directory.path;
  }

  Widget _build() {
    return FutureBuilder(
      future: _initialize(),
      builder: (context, snapshot) => ListTile(
        dense: true,
        leading: SizedBox(
          width: 96.0,
          height: 54.0,
          child: _directory != null
              ? (widget.lesson.videoUrl!.contains('.mp4')
                  ? Thumbnail(
                      thumbnailRequest: ThumbnailRequest(
                        video: widget.lesson.videoUrl!,
                        thumbnailPath: _directory!,
                        imageFormat: ImageFormat.JPEG,
                        maxHeight: 54,
                        maxWidth: 96,
                        timeMs: 0,
                        quality: 100,
                      ),
                    )
                  : Image.network(
                      YoutubePlayer.getThumbnail(
                        videoId: YoutubePlayer.convertUrlToId(
                            widget.lesson.videoUrl!)!,
                      ),
                      height: 54,
                      width: 96,
                      fit: BoxFit.fill,
                    ))
              : CircularProgressIndicator(),
        ),
        title: Align(
          child: Container(
            child: AutoSizeText(
              widget.lesson.name.toString(),
              style: Theme.of(context).textTheme.bodyText1,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              presetFontSizes: [
                Theme.of(context).textTheme.bodyText1!.fontSize!.toDouble()
              ],
            ),
          ),
          alignment: Alignment(0, 0.0),
        ),
        subtitle: Text(
          Duration(seconds: (widget.lesson.hours! * 3600).toInt())
              .toString()
              .split('.')[0],
          style: Theme.of(context).textTheme.bodyText1,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              child: Icon(
                Icons.play_circle_outline,
                size: 24.0,
                color: Colors.white,
              ),
              onTap: () => CoursePage.of(context)!.lesson = widget.lesson,
            ),
            HorizontalSpacer(distance: 4.0),
            InkWell(
              child: Icon(
                Icons.more_horiz_rounded,
                size: 24.0,
              ),
              onTap: () => {},
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _build();
  }
}
