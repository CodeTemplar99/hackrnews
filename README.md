# HackrNews App

This is a Flutter application that allows users to consume news from hacker news' endpoint. It provides two main views: a list of news articles and a detailed view for each article. The app is deployed using Firebase Distribution, allowing for easy distribution and testing.

## Features

- Fetches news articles from a new endpoint.
- Displays a list of news articles with their titles, descriptions, and thumbnails.
- Allows users to select a news article to view its details.
- Shows the detailed view of a news article with its title, description, thumbnail, and full content.

## Screenshots

<img src="[path/to/image.jpg](https://github.com/CodeTemplar99/hackrnews/assets/36797498/6b089b87-686d-42ae-b508-3a356b0f1899)" alt="Image description" width="300" />
<!-- ![Home screen]() -->

<!-- ![View news screen](https://github.com/CodeTemplar99/hackrnews/assets/36797498/1284e56d-48da-44f7-8b49-2cce0036e64f) -->



## Installation

1. Clone the repository: `git clone https://github.com/CodeTemplar99/hackrnews.git`.
2. Change into the project directory: `cd your-repo`.
3. Install the dependencies: `flutter pub get`.
4. Run the app: `flutter run`.

## Dependencies

This app relies on the following dependencies:

- [Flutter](https://flutter.dev)
- [http](https://pub.dev/packages/http) - for making HTTP requests to the news endpoint.
- [google_fonts](https://pub.dev/packages/google_fonts) - for efficiently styling fonts
- [provider](https://pub.dev/packages/provider) - state management solution
- [shimmer](https://pub.dev/packages/shimmer) - for animation the loading while fetching data

## Firebase Distribution

The app is deployed using Firebase Distribution, which allows for easy distribution and testing. To access the latest version of the app, follow these steps:

1. Visit the Firebase Distribution URL: [https://appdistribution.firebase.dev/i/b2da07c689835412].
2. Download and install the app on your device.
3. Launch the app to start using it.

## Usage

To use the app, follow these steps:

1. Launch the app on your device or emulator.
2. On the main screen, you will see a list of news articles.
3. Tap on an article to view its details.
4. In the article details view, you can read the full content of the news article.

## Contributing

Contributions are welcome! If you'd like to contribute to this project, please follow these steps:

1. Fork the repository.
2. Create a new branch: `git checkout -b my-feature`.
3. Make your changes and commit them: `git commit -m 'Add some feature'`.
4. Push to the branch: `git push origin my-feature`.
5. Submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
