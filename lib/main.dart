import 'package:flutter/material.dart';
import 'views/story_group_view.dart';
import 'models/story_group.dart';
import 'models/story.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Instagram Stories',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample data
    final storyGroups = [
      StoryGroup(
        id: '1',
        stories: [
          Story(
              id: '1',
              url:
                  'https://images.unsplash.com/photo-1534103362078-d07e750bd0c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
              isVideo: false),
          Story(
              id: '2',
              url:
                  'https://static.videezy.com/system/resources/previews/000/007/536/original/rockybeach.mp4',
              isVideo: true),
        ],
      ),
    ];

    return Scaffold(
      body: StoryGroupView(
          storyGroup:
              storyGroups[0]), // Displaying the first story group as an example
    );
  }
}
