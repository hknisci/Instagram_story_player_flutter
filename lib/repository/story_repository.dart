import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/story.dart';
import '../models/story_group.dart';

class StoryRepository {
  final String baseUrl;

  StoryRepository({required this.baseUrl});

  Future<List<StoryGroup>> fetchStoryGroups() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((group) => StoryGroup.fromJson(group)).toList();
    } else {
      throw Exception('Failed to load story groups');
    }
  }
}
