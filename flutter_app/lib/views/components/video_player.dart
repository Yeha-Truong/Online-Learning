import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ChewieVideoPlayer extends StatefulWidget {
  ChewieVideoPlayer({required this.url});

  final String url;

  @override
  State<StatefulWidget> createState() {
    return _ChewieVideoPlayerState();
  }
}

class _ChewieVideoPlayerState extends State<ChewieVideoPlayer> {
  late VideoPlayerController _videoPlayerController1;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController1 = VideoPlayerController.network(widget.url);
    await Future.wait([_videoPlayerController1.initialize()]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: true,
      looping: true,
      //showControls: false,
      autoInitialize: true,
      allowFullScreen: false,
      allowMuting: false,
      aspectRatio: 16 / 9,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.width * 9 / 16,
        child: _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? Chewie(
                controller: _chewieController!,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text('Loading'),
                ],
              ),
      ),
    );
  }
}
