# Flutter Widgets Application

This is a widget oriented Flutter application developed in Dart. The aim is to showcase a range of widgets that can be used in the development of mobile applications using the Flutter SDK.


## Features

- Main Dart application showcasing a range of flutter widgets.
- Custom configured router named appRouter.
- Custom theme using AppTheme.

## Installation

Ensure that you have Flutter and Dart set up and installed on your machine. Once done, run the following command in the root directory to install necessary dependencies
```
flutter pub get
```

## Usage
To launch the application in the development mode, navigate to the root directory of the project and run in your terminal:

```
flutter run
```

## Application Entry Point
The primary entry point of the application is a WidgetsMainApp class which is a StatelessWidget.

```
class WidgetsMainApp extends StatelessWidget {
  const WidgetsMainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Widgets',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(
        selectedColor: 3,
      ).getTheme(),
    );
  }
}
```

- Where appRoute is defined elsewhere in the project and contains all the paths to the different widgets.
- AppTheme is a class that wraps the project's theme information.