<div align="center">
<h1>TaskZen</h1>
</div>
<div align="center">
   <img src="assets/logo/TaskZen_logo.png" alt="Home" width="300"/>
</div>

## 📱 Screenshots

<table style={border:"none"}>
   <tr>
      <td><img src="assets/screenshots/light_theme/home_screen.png" alt="Home Screen" width="500"/></td>
      <td><img src="assets/screenshots/light_theme/calendar_screen.png" alt="Calendar Screen" width="500"/></td>
      <td><img src="assets/screenshots/light_theme/task_details_screen.png" alt="Task Details Screen" width="500"/></td>
   </tr>
   <tr>
      <td><img src="assets/screenshots/light_theme/new_task_screen.png" alt="New Task Screen" width="500"/></td>
      <td><img src="assets/screenshots/light_theme/update_task_screen.png" alt="Update Task Screen" width="500"/></td>
   </tr>

</table>

<!-- Add screenshots of your app here -->
<!--|             |                 |                     |                 |                   |
|-------------|-----------------|---------------------|-----------------|-------------------|
<img src="assets/screenshots/light_theme/home_screen.png" alt="Home" width="350"/> | <img src="assets/screenshots/light_theme/calendar_screen.png" alt="Calendar" width="350"/> | <img src="assets/screenshots/light_theme/task_details_screen.png" alt="Task Details" width="350"/> | <img src="assets/screenshots/light_theme/new_task_screen.png" alt="New Task" width="350"/> | <img src="assets/screenshots/light_theme/update_task_screen.png" alt="Update Task" width="350"/>-->

## ✨ Features

- **Task Management**: Create, read, update, and delete tasks with ease
- **Task Status Filtering**: Filter tasks by status (To Do, In Progress, Completed) using filter chips
- **Interactive Calendar**: View task count for each day with visual indicators and click on any day to see specific tasks
- **Cross-platform**: Works on both iOS and Android
- **Responsive Design**: Adapts to different screen sizes
<!--- **Offline Support**: Works without internet connection-->

## 🚀 Getting Started

### Prerequisites

Before running this project, make sure you have the following installed:

- [Flutter](https://flutter.dev/docs/get-started/install) (version 3.0.0 or higher)
- [Dart](https://dart.dev/get-dart) (version 3.0.0 or higher)
- [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/)
- [Xcode](https://developer.apple.com/xcode/) (for iOS development, macOS only)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/TaskZen.git
   cd TaskZen
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```



### Platform-specific Setup

#### Android
- Minimum SDK version: 21
- Target SDK version: 34
- Make sure you have an Android device connected or an emulator running

#### iOS
- Minimum iOS version: 11.0
- Xcode 12.0 or higher
- Valid Apple Developer account (for device testing)

## 🏗️ Project Structure

```
lib/
├── main.dart                          # 🚀 App entry point and initialization
├── core/                              # 🏛️ Core functionality and shared components
└── features/                          # 📱 Feature-based architecture
    └── feature/                   
        ├── data/                      # 💾 Data layer
        │   ├── models/                # 📊 Models
        │   └── repositories/          # 📚 Repository implementations
        └── presentation/              # 🎭 UI layer
            ├── manager/               # 🎛️ state management (BLoC/Cubit)
            └── views/                 # 👀 Screens and widgets
```

## 📦 Dependencies

### Main Dependencies
- `flutter/material.dart` - Material Design components and widgets
- `dartz` - Functional programming utilities (Either, Option types)
- `dio` - Powerful HTTP client for API requests and interceptors
- `flutter_bloc` - State management using BLoC pattern
- `go_router` - Declarative routing and navigation
- `google_nav_bar` - Animated bottom navigation bar with Google style
- `shared_preferences` - Local key-value storage for app preferences
- `skeletonizer` - Loading skeleton animations for better UX
- `table_calendar` - Customizable calendar widget with events support
- `flutter_native_splash` - Create native splash screens for iOS and Android

### Dev Dependencies
- `flutter_test` - Built-in testing framework for unit and widget tests
- `flutter_lints` - Official Dart linting rules for code quality
- `flutter_launcher_icons` - Generate app launcher icons for all platforms
- `mockito` - Mock objects for unit testing and dependency isolation

## 🧪 Testing

Run the test suite:

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run integration tests
flutter drive --target=test_driver/app.dart
```

## 🚀 Building for Production

### Android (APK)
```bash
flutter build apk --release
```

### Android (App Bundle)
```bash
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

## 🔗 Backend
This app connects to a Node.js backend API. You can find the backend repository here:
- **Repository**: [TaksZen Backend Repo](https://github.com/yourusername/your-backend-repo)
- **Technology**: Node.js
- **Documentation**: API documentation available in the backend repo

## 🤝 Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<!--### Code Style

This project follows the [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style). Make sure to:

- Run `dart format .` before committing
- Follow the linting rules defined in `analysis_options.yaml`
- Write meaningful commit messages-->

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE.md) file for details.

<!--## 👥 Authors

- **Your Name** - *Initial work* - [YourGitHub](https://github.com/yourusername)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- [Package Name] for [specific functionality]
- Community contributors and testers-->

## 📞 Support

If you have any questions or need help, please:

1. Check the [Issues](https://github.com/firashedfi5/TaskZen/issues) page
2. Create a new issue if your problem isn't already reported
3. Contact me at: firashedfi4@gmail.com

## 🔄 Changelog

### Version 1.0.0
- Initial release
- Basic functionality implemented
- Cross-platform support

---

**Happy coding! 🎉**
