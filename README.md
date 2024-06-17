# Gallery App for internship

A simple project as a internship task to test your skills at coding in Flutter after doing an 30h course on Flutter.

## Running the project

In order to run the project, you need to have the [Flutter SDK](https://flutter-ko.dev/development/tools/sdk/release) installed on your machine. 
If you don't have it yet, you can find the instructions on how to install it [here](https://flutter.dev/docs/get-started/install).

With the Flutter SDK installed, you can run the project by executing the following command in the project's root folder:

```
flutter run
```

## The purpose of the project

Mainly the initial idea of a project is to create a simple gallery app that fetches images from the internet and displays them in a grid. Also on the second screen - comments list fetched by http request of a JSON file. The app should have three screens (in my case):

**1.** ```albums_screen.dart``` - gallery screen that displays the images in a grid.
**2.** ```comments_screen.dart``` - list of comments.
**3.** ```tabs_screen.dart``` - navigation between those two screens.