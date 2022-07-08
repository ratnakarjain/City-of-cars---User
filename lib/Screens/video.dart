import 'package:cityofcars/Utils/constants.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoApp extends StatefulWidget {
  String video;
  VideoApp({Key? key, required this.video}) : super(key: key);
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        // "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
        widget.video
        // "https://media.istockphoto.com/videos/view-of-clouds-over-the-mountains-from-above-video-id1316701553"
        )
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblackcolor,
      body: Hero(
        tag:"video",
        child: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : loder,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class Videophoto extends StatefulWidget {
  String video;
   Videophoto({ Key? key, required this.video }) : super(key: key);

  @override
  State<Videophoto> createState() => _VideophotoState();
}

class _VideophotoState extends State<Videophoto> {
  @override
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        // "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
        widget.video
        // "https://media.istockphoto.com/videos/view-of-clouds-over-the-mountains-from-above-video-id1316701553"
        )
      ..initialize().then((_) {

        setState(() {});
      })..addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: BorderRadius.circular(10),
        child: _controller.value.isInitialized
            ? VideoPlayer(_controller)
            : Container(),
      
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}