# movies_flutter_sample

MovieApp is a Flutter-based mobile application that displays popular movies using the [TMDB (The Movie Database) API](https://www.themoviedb.org/documentation/api). This initial version fetches and showcases popular movies in an interactive user interface.

## Features
- Fetches and displays a list of popular movies from the TMDB API.
- Uses the `dio` package for efficient and manageable HTTP requests.
- Incorporates the MVVM architecture for a clean and maintainable codebase.
- Follows SOLID principles to promote robust and scalable application design.
- Utilizes an event-notify system to handle layout changes efficiently using the Observer pattern.

## Technologies and Tools Used

### 1. [Flutter](https://flutter.dev/)
- The app is built using Flutter, Google's open-source UI toolkit for crafting high-quality native interfaces on iOS and Android.

### 2. [TMDB API](https://www.themoviedb.org/documentation/api)
- The application fetches data from the TMDB API to display the most popular movies.

### 3. [Dio](https://pub.dev/packages/dio)
- A powerful HTTP client for Dart, used to make network requests to the TMDB API with features like interceptors, global configuration, and more.

### 4. [GetIt](https://pub.dev/packages/get_it)
- A service locator for Flutter to manage dependency injection, making it easier to implement the MVVM architecture and separate concerns in the codebase.

### 5. [Mockito](https://pub.dev/packages/mockito)
- A Dart package used to create mock classes for unit testing, ensuring that the application logic behaves as expected without relying on external dependencies like API calls.

### 6. MVVM Architecture
- The app is designed following the Model-View-ViewModel (MVVM) architecture pattern to separate the UI code from the business logic, making it easier to manage and scale.

### 7. SOLID Principles
- Adheres to SOLID principles to maintain a clean and modular codebase:
  - **Single Responsibility Principle**: Each class has a single responsibility.
  - **Open/Closed Principle**: Code is open for extension but closed for modification.
  - **Liskov Substitution Principle**: Base classes can be replaced by their derived classes.
  - **Interface Segregation Principle**: Interfaces are split into smaller, more specific ones.
  - **Dependency Inversion Principle**: Higher-level modules are not dependent on lower-level modules.

### 8. Event Notify (Observer Pattern)
- The app employs an event notification system to handle changes in the layout using the Observer pattern. This decouples the UI from the business logic, allowing for more responsive and manageable UI updates.

## Testing
The app uses the `Mockito` package for unit testing. To run the tests, use:
\`\`\`bash
flutter test
\`\`\`

## Future Enhancements
- Add more movie details such as trailers, reviews, and ratings.
- Implement user authentication and personalized movie recommendations.
- Expand the app to support other media content like TV shows and series.
- Integrate more features from the TMDB API, such as movie search, top-rated, and trending movies.


## Acknowledgments
- [TMDB](https://www.themoviedb.org/) for providing the movie database API.
- [Flutter](https://flutter.dev/) for enabling rapid cross-platform mobile development.
- The open-source community for providing packages like `dio`, `GetIt`, and `Mockito`.
