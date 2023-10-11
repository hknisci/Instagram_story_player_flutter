import 'dart:async';
import 'package:flutter/material.dart';

class StoryController {
  late Timer _timer;
  final Duration storyDuration;
  final VoidCallback onStoryEnd;
  final VoidCallback onStoryStart;

  StoryController({
    required this.storyDuration,
    required this.onStoryEnd,
    required this.onStoryStart,
  });

  void startStory() {
    onStoryStart();
    _timer = Timer(storyDuration, () {
      onStoryEnd();
    });
  }

  void pauseStory() {
    _timer.cancel();
  }

  void resumeStory() {
    final timeRemaining = _timer.tick;
    _timer =
        Timer(Duration(seconds: storyDuration.inSeconds - timeRemaining), () {
      onStoryEnd();
    });
  }

  void nextStory() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    onStoryEnd();
  }

  void previousStory() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    onStoryStart();
  }

  void dispose() {
    if (_timer.isActive) {
      _timer.cancel();
    }
  }
}
