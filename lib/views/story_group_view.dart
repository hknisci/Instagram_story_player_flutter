import 'package:flutter/material.dart';
import '../models/story_group.dart';
import 'story_view.dart';
import 'progress_bar.dart';

class StoryGroupView extends StatefulWidget {
  final StoryGroup storyGroup;

  StoryGroupView({required this.storyGroup});

  @override
  _StoryGroupViewState createState() => _StoryGroupViewState();
}

class _StoryGroupViewState extends State<StoryGroupView> {
  int currentStoryIndex = 0;

  void _nextStory() {
    if (currentStoryIndex < widget.storyGroup.stories.length - 1) {
      setState(() {
        currentStoryIndex++;
      });
    }
  }

  void _previousStory() {
    if (currentStoryIndex > 0) {
      setState(() {
        currentStoryIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StoryView(story: widget.storyGroup.stories[currentStoryIndex]),
        Positioned(
          top: 10.0,
          left: 0,
          right: 0,
          child: ProgressBar(
            duration: Duration(seconds: 5), // Örnek olarak 5 saniye
            position: Duration(seconds: 2), // Örnek olarak 2 saniye
          ),
        ),
        Positioned.fill(
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(onTap: _previousStory),
              ),
              Expanded(
                child: GestureDetector(onTap: _nextStory),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
