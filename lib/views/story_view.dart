import 'package:flutter/material.dart';
import '../models/story.dart';
import 'package:video_player/video_player.dart';

class StoryView extends StatefulWidget {
  final Story story;

  StoryView({required this.story});

  @override
  _StoryViewState createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    if (widget.story.isVideo) {
      _controller = VideoPlayerController.network(widget.story.url)
        ..initialize().then((_) {
          setState(() {});
          _controller!.play();
        });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('Story tapped!'),
      child: widget.story.isVideo
          ? (_controller?.value.isInitialized ?? false)
              ? AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: VideoPlayer(_controller!),
                )
              : Center(child: CircularProgressIndicator())
          : Image.network(
              widget.story.url,
              fit: BoxFit.cover,
            ),
    );
  }
}
