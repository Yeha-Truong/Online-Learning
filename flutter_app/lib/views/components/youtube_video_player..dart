import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoPlayer extends StatefulWidget {
  YoutubeVideoPlayer({required this.url});

  final String url;

  @override
  State<StatefulWidget> createState() {
    return _YoutubeVideoPlayerState();
  }
}

class _YoutubeVideoPlayerState extends State<YoutubeVideoPlayer> {
  YoutubePlayerController? _controller;
  String? _currentId;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url).toString(),
      flags: YoutubePlayerFlags(
        hideControls: false,
        controlsVisibleAtStart: true,
        autoPlay: false,
        mute: false,
      ),
    );
    _currentId = YoutubePlayer.convertUrlToId(widget.url).toString();
  }

  @override
  void deactivate() {
    _controller!.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _updatePlayer() {
    if (_controller != null) if (_currentId !=
        YoutubePlayer.convertUrlToId(widget.url)) {
      _controller!.load(YoutubePlayer.convertUrlToId(widget.url).toString());
      _currentId = YoutubePlayer.convertUrlToId(widget.url).toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    _updatePlayer();
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.width * 9 / 16,
        child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller!,
            showVideoProgressIndicator: true,
          ),
          builder: (context, player) => Scaffold(
            body: player,
          ),
        ),
      ),
    );
  }
}
