# Maids.cc - Flutter Project

## Project Overview
Maids.cc is a Flutter application designed to list some already created todos. This document provides the necessary steps to set up and run the project on your local machine.

## Prerequisites

- **Flutter**: Version 3.19.3
- **Dart**: Version 3.3.1
- **Android SDK**: Version 34.0.0
- **Xcode**: Version 15.4 (for iOS development)
- **Java**: OpenJDK Runtime Environment (build 17.0.6)

Ensure that you have the required versions installed. You can check your versions by running:
```sh
flutter doctor -v
```
## Getting Started

Follow these steps to set up and run the project:

- **Clone the repository**:
```sh
git clone https://github.com/nabil-hfz/maids.git
```
- **Clean the project and fetch dependencies**: 
```sh
flutter clean && flutter pub get
```
- **Run the application**: 
```sh
flutter run --dart-define=BASE_URL=https://dummyjson.com/
```
