# 🎥 Flutter Movie App

A feature-rich Flutter application for movie enthusiasts! This app provides seamless Google authentication, access to a vast collection of movies fetched from TMDB, detailed information about actors, and an integrated rating system to let users express their opinions about the movies they watch.

---

## 🚀 Features

- **Google Authentication**: Secure and hassle-free sign-in using your Google account.
- **Browse Movies**: Access a wide variety of movies fetched dynamically from [The Movie Database (TMDB)](https://www.themoviedb.org/).
- **Detailed Movie Information**: Get comprehensive details about movies, including overviews, genres, and release dates.
- **Actor Information**: Learn about the cast and crew, with profiles and filmography details.
- **Rating System**: Rate movies and view aggregate ratings to make informed choices.

---

## 🛠️ Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/flutter-movie-app.git
   cd flutter-movie-app
   ```

2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Set Up API Keys**:
   - **TMDB API Key**:
     - Sign up or log in to [TMDB](https://www.themoviedb.org/).
     - Create an API key and paste it into the app's `lib/config.dart` file as follows:
       ```dart
       const String tmdbApiKey = 'YOUR_TMDB_API_KEY';
       ```
   - **Google Authentication**:
     - Set up a project on [Google Cloud Console](https://console.cloud.google.com/).
     - Configure OAuth credentials and download the `google-services.json` file (for Android) or `GoogleService-Info.plist` file (for iOS).
     - Place the files in the respective directories of your Flutter project.

4. **Run the Application**:
   ```bash
   flutter run
   ```

---

## 🔧 Technologies Used

- **Flutter**: Frontend framework for building cross-platform mobile apps.
- **Firebase Authentication**: For Google sign-in functionality.
- **TMDB API**: To fetch movie data.
- **Provider/Bloc (State Management)**: For app state management.

---

## 📂 Project Structure

```plaintext
lib/
├── main.dart                # Entry point of the app
├── screens/                 # UI screens for various pages
├── widgets/                 # Reusable UI components
├── models/                  # Data models for movies and actors
├── services/                # TMDB API and authentication services
├── config.dart              # API keys and configurations
└── utils/                   # Utility functions and helpers
```

---

## 🛡️ License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## 🤝 Contributing

Contributions are welcome! Feel free to open issues or submit pull requests to improve this project.

---

## 📧 Contact

For any questions or feedback, reach out to me at [your-email@example.com](mailto:your-email@example.com).

---

### ⭐ Don't forget to star the repository if you found this project useful!

