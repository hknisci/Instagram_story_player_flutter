class Story {
  final String id;
  final String url;
  final bool isVideo;
  final Duration duration;

  Story(
      {required this.id,
      required this.url,
      required this.isVideo,
      this.duration = const Duration(seconds: 5)});

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      id: json['id'],
      url: json['url'],
      isVideo: json['isVideo'],
      duration: Duration(seconds: json['duration'] ?? 5),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
        'isVideo': isVideo,
        'duration': duration.inSeconds,
      };
}
