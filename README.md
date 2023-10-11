# Flutter Instagram Story Player

Flutter Instagram Story Player is a story player developed with Flutter, mimicking the Instagram story feature. This project provides a structure that allows users to create and view stories similar to Instagram.

## Getting Started

Follow the steps below to run this project on your local machine.

### Prerequisites

- Flutter SDK
- Dart SDK

### Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/hknisci/Instagram_story_player_flutter.git
   ```
2. Install dependencies:
   ```sh
   flutter pub get
   ```
3. Run the app:
   ```sh
   flutter run
   ```
   
## Usage

The project is built upon a structure that mimics Instagram stories. Stories can be in video or image format and each story is displayed on the screen for a certain duration.

### Key Components

- [Story](https://github.com/hknisci/Instagram_story_player_flutter/blob/main/lib/models/story.dart): Represents stories and has properties like `url`, `isVideo`, and `duration`.
- [StoryGroup](https://github.com/hknisci/Instagram_story_player_flutter/blob/main/lib/models/story_group.dart): Gathers multiple stories and manages them as a group.
- [StoryView](https://github.com/hknisci/Instagram_story_player_flutter/blob/main/lib/views/story_view.dart): The widget where stories are displayed.
- [StoryController](https://github.com/hknisci/Instagram_story_player_flutter/blob/main/lib/utils/story_controller.dart): Manages the playback, pause, and next/previous story transitions of stories.
- [StoryBloc](https://github.com/hknisci/Instagram_story_player_flutter/blob/main/lib/blocks/story_bloc.dart): Manages the state of stories and story groups.

### Example Usage

You can use the sample data specified in the `MyHomePage` widget to create and view an example story group.

## Contributing

To fix bugs, make improvements, or add new features to the project, please follow the steps below:

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
