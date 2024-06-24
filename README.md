# Task Manager App Documentation

## Overview
This document provides an explanation of the folder structure, the purpose of each folder, and the files within the Flutter app project "Task Manager App." It also outlines the methodologies and technologies used in the project.

## What I Did
I developed a Flutter application named "Task Manager App" to manage and track tasks related to plant care. The app features a robust task management system built using the BLoC (Business Logic Component) pattern, various custom widgets, and a well-structured architecture to separate concerns and promote scalability and maintainability.

## What I Used
* **Flutter:** As the primary framework for building the mobile application.
* **Dart:** The programming language used to develop the app.
* **BLoC Pattern:** To manage state and business logic.
* **HTTP Service:** For network requests.
* **Shared Preferences:** To handle local storage.
* **Custom Widgets:** To create reusable UI components.

## Folder Structure Overview

```bash
plantist_app/
├── lib/
│   ├── main.dart
│   ├── feature/
│   │   ├── task/
│   │   │   ├── bloc/
│   │   │   │   └── task_bloc.dart
│   │   │   │   └── task_event.dart
│   │   │   │   └── task_state.dart
│   │   │   ├── view/
│   │   │   │   ├── src/
│   │   │   │   │   └── bloc_builder.dart
│   │   │   │   └── add_task_screen.dart
│   │   │   │   └── detail_task_screen.dart
│   │   │   │   └── fetch_task_screen.dart
│   │   │   ├── service/
│   │   │   │   └── task_service.dart
│   │   │   ├── model/
│   │   │   │   └── task_model.dart
│   ├── product/
│   │   ├── constant/
│   │   │   ├── color_constant.dart
│   │   │   ├── base_constant.dart
│   │   ├── utils/
│   │   │   ├── service/
│   │   │   │   └── http_service.dart
│   │   │   │   └── shared_preferences_service.dart
│   │   │   ├── size/
│   │   │   │   └── size_utils.dart
│   │   │   ├── validation/
│   │   │   │   └── add_task_from_validation.dart
│   │   ├── widgets/
│   │   │   ├── button/
│   │   │   │   └── custom_button_widget.dart
│   │   │   ├── text/
│   │   │   │   └── custom_text_widget.dart
│   │   │   ├── text_field/
│   │   │   │   └── custom_textfield_widget.dart
│   │   │   ├── image/
│   │   │   │   └── custom_image_view_widget.dart
```
## 1. lib/
The lib directory is the main directory for all the Dart code for the application.

## 2. lib/main.dart
The entry point of the application. This file initializes the app and sets up the main widget.

## 3. lib/feature/
This directory contains features of the app, in this case, related to tasks.

### 3.1 lib/feature/task/
Contains everything related to the task feature.

#### 3.1.1 bloc/
Manages the business logic of the task feature using the BLoC pattern.
task_bloc.dart: Handles the business logic for tasks.
task_event.dart: Defines events for the task BLoC.
task_state.dart: Defines states for the task BLoC.
#### 3.1.2 view/
Contains the UI components related to the task feature.

##### 3.1.2.1 src/
Contains additional widgets for the task views.
bloc_builder.dart: A custom widget that helps in building the UI based on the BLoC state.
Other view files:
add_task_screen.dart: UI for adding a new task.
detail_task_screen.dart: UI for displaying task details.
fetch_task_screen.dart: UI for fetching and displaying tasks.

#### 3.1.3 service/
Handles the service layer for tasks.
task_service.dart: Contains the logic for interacting with APIs or other services related to tasks.
#### 3.1.4 model/
Contains data models related to tasks.
task_model.dart: Defines the data structure for a task.

## 4. lib/product/
This directory contains shared resources and utilities across the entire application.

### 4.1 constant/
Contains constants used throughout the app.
color_constant.dart: Defines color constants.
base_constant.dart: Defines other base constants.

### 4.2 utils/
Contains utility classes and functions.

#### 4.2.1 service/
http_service.dart: Manages HTTP requests.
shared_preferences_service.dart: Manages shared preferences for local storage.
#### 4.2.2 size/
size_utils.dart: Contains utilities for handling sizes and dimensions.
#### 4.2.3 validation/
add_task_from_validation.dart: Contains validation logic for the add task form.

### 4.3 widgets/
Contains reusable UI components.

#### 4.3.1 button/
custom_button_widget.dart: A custom button widget.
#### 4.3.2 text/
custom_text_widget.dart: A custom text widget.
#### 4.3.3 text_field/
custom_textfield_widget.dart: A custom text field widget.
#### 4.3.4 image/
custom_image_view_widget.dart: A custom image view widget.

