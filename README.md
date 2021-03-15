# PUSH Mobile App

## Getting Started

Prior to cloning this repo, be sure to install Flutter following the [documentation](https://flutter.dev/docs/get-started/install). The preferred IDE for Flutter development is [VSCode](https://code.visualstudio.com/), however, Flutter also has plugin support for [Android Studio](https://developer.android.com/studio) & [IntelliJ](https://www.jetbrains.com/idea/download/)


If you are using VSCode, be sure to install the following:

- [Dart](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code)
- [Flutter](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter)
- [Aweseome Flutter Snippets](https://marketplace.visualstudio.com/items?itemName=Nash.awesome-flutter-snippets)
- [GetX Snipppets](https://marketplace.visualstudio.com/items?itemName=get-snippets.get-snippets) (optional)
- [Bracket Pair Colorizer 2](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer-2) (optional)

### Emulators

To run the app on an emulated ios or Android device, you'll need to install [XCode](https://apps.apple.com/us/app/xcode/id497799835?mt=12) & [Android Studio](https://developer.android.com/studio) (Note: since we have enabled support for web, you can also emulate using your browser and dev tools).

Once you've installed your emulators, you are all set. To confirm your setup, run `flutter doctor` and ensure you have all checkmarks like such:

```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel beta, 1.23.0-18.1.pre, on Mac OS X 10.15.7 19H2 x86_64, locale en-US)
[✓] Android toolchain - develop for Android devices (Android SDK version 30.0.2)
[✓] Xcode - develop for iOS and macOS (Xcode 12.0.1)
[✓] Chrome - develop for the web
[✓] Android Studio (version 4.1)
[✓] VS Code (version 1.51.1)
[✓] Connected device (2 available)

• No issues found!
```

## Running App

### VSCode (preferred for debugging)

- From the command palette (`CMD + SHFT + P`) select `Flutter: Select Device`
- Pick your emulator or web browser of choice (or create a new emulator if need be)
- Click the Run/Debug Tab
- Select "Run App" from the Dropdown
- Click the "Run" button

### Terminal

- Run `flutter devices` to list all of your possible emulators
- Run `flutter run lib/app/main.dart -d [device-name]` (i.e. chrome)

## Running Storybook

### VSCode:

- From the command palette (`CMD + SHFT + P`) select `Flutter: Select Device`
- Pick your web browser of choice
- Click the Run/Debug Tab
- Select "Run Storybook" from the Dropdown
- Click the "Run" button

### Terminal

- Run `flutter devices` to list all of your possible emulators
- Run `flutter run lib/storybook/main_story.dart -d [device-name]` (i.e. chrome)

## Packages

Similar to NPM, Flutter & Dart have a shared open source package management system called [pub.dev](https://pub.dev/). Dart codebase make use of a `pubspec.yaml` file to keep track of the dependencies for a given project. Whenever you pull in `develop`, run `flutter pub get` to install any new packages added to the repo. (VS Code is set to do this automatically by default).

Currently, this repo relies on the following packages:

- [get](https://pub.dev/packages/get): A loaded all-in-one, state, routing, and dependency management package.
- [storybook_flutter](https://pub.dev/packages/storybook_flutter): A Flutter take on storybookjs. Lightweight, but fairly useful for storybooking widgets during development
- [flutter_svg](https://pub.dev/packages/flutter_svg): Standard svg library to enable the rendering of custom svg files
- [pedantic](https://pub.dev/packages/pedantic): Dart code analysis (Our custom rules are written in `analysis_options.yaml`)
- [faker](https://pub.dev/packages/faker): Simple helper library for generating fake data (this is used for storybook renderings)

## Project Structure

The structure for the project is heavily influenced by this open source [getx_pattern](https://github.com/kauemurakami/getx_pattern)

```
/android # Android platform specific files (minimal use)
/ios  # iOS platform specific files (minimal use)
/lib  # Flutter code
    /app  # App code
        /controllers # Classes for app-wide state (i.e. CartController, CustomerController)
        /data  # All classes dealing with app data
            /models	 # Basic Dart classes to represent our data received from our APIs (i.e. Product, Dispensary, Customer, etc)
            /providers  # Classes/Wrappers for API use
	    /repositories  # Model-specfic provider calls to be used by controllers. Typically there is a one Repository for each entity/db collection (i.e. ProductProvider, DispensaryProvider etc.)
        /pages  # Home for all of our app's pages
	    /some_page_name # Page-specific directory
	        page_name.dart  # A single app page
	        page_bindings.dart #  A class used to define instances of the dependancies needed for this page (if they don't already exist)
	        widgets/  # Page-specifc widgets
        /theme # App-wide theming (colors, icons, etc)
        /uitls # Shared utility classes/functions
        /widgets  # Shared widgets used throughout the app
        main.dart  # Entry-point for the app
        pages.dart  # Definition of the pages to be used within the apps routing system
        routes.dart  # All of the apps route urls
    /assets  # Images, fonts, svgs, etc
    /storybook  # Storybook code
	main_story.dart # Entry-point for the storybook app
/test  # All tests (folder structure typically follows the /app directory structure)
/web  # Web platform specific files (minimal use)

```
