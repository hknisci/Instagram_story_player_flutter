import 'story.dart';

class StoryGroup {
  final String id;
  final List<Story> stories;

  StoryGroup({
    required this.id,
    required this.stories,
  });

  factory StoryGroup.fromJson(Map<String, dynamic> json) {
    return StoryGroup(
      id: json['id'],
      stories: (json['stories'] as List<dynamic>)
          .map((storyJson) => Story.fromJson(storyJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'stories': stories.map((story) => story.toJson()).toList(),
      };
}
