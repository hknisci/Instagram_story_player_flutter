import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

// Model
class Story {
  final String url;
  final bool isVideo;
  final Duration duration;
  Story(
      {required this.url,
      required this.isVideo,
      this.duration = const Duration(seconds: 5)});
}

class StoryGroup {
  final List<Story> stories;
  StoryGroup({required this.stories});
}

// Event
abstract class StoryEvent {}

class LoadStoryEvent extends StoryEvent {
  final int storyIndex;
  LoadStoryEvent({required this.storyIndex});
}

// State
abstract class StoryState {}

class StoryInitialState extends StoryState {}

class StoryLoadedState extends StoryState {
  final Story story;
  StoryLoadedState({required this.story});
}

// BLoC
class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final List<StoryGroup> storyGroups;
  int currentGroupIndex = 0;
  int currentStoryIndex = 0;

  StoryBloc({required this.storyGroups}) : super(StoryInitialState());

  @override
  Stream<StoryState> mapEventToState(StoryEvent event) async* {
    if (event is LoadStoryEvent) {
      currentStoryIndex = event.storyIndex;
      yield StoryLoadedState(
          story: storyGroups[currentGroupIndex].stories[currentStoryIndex]);
    }
  }

  void nextStory() {
    if (currentStoryIndex < storyGroups[currentGroupIndex].stories.length - 1) {
      add(LoadStoryEvent(storyIndex: currentStoryIndex + 1));
    } else if (currentGroupIndex < storyGroups.length - 1) {
      currentGroupIndex++;
      add(LoadStoryEvent(storyIndex: 0));
    }
  }

  void previousStory() {
    if (currentStoryIndex > 0) {
      add(LoadStoryEvent(storyIndex: currentStoryIndex - 1));
    } else if (currentGroupIndex > 0) {
      currentGroupIndex--;
      add(LoadStoryEvent(
          storyIndex: storyGroups[currentGroupIndex].stories.length - 1));
    }
  }
}
