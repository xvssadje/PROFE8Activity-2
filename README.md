# Sign Language App

A Flutter mobile application for learning sign language, built as part of hands-on learning activities.

## Project Structure

This project follows a clean architecture pattern with organized folders:

### Folder Organization

\`\`\`
lib/
├── models/          # Data models and entities
├── views/           # UI screens and pages
├── widgets/         # Reusable UI components
└── services/        # Business logic and data services
\`\`\`

### Why This Structure?

1. **models/** - Contains data structures (SignLesson) that represent the core entities of our app. This separation makes it easy to modify data structures without affecting UI code.

2. **views/** - Houses all the screen-level widgets (HomePage, LearnPage, etc.). This keeps navigation and page-level logic organized in one place.

3. **widgets/** - Stores reusable UI components (CustomButton) that can be used across multiple screens. This promotes code reuse and consistency.

4. **services/** - Contains business logic and data operations (LessonService). This separates data management from UI, making the code more testable and maintainable.

## Completed Activities

### First Activity Tasks
1. ✅ Project structure with models, views, widgets, and services folders
2. ✅ Hello World app with StatelessWidget (hello_world_stateless.dart)
3. ✅ Hello World app with StatefulWidget and counter (hello_world_stateful.dart)
4. ✅ Custom reusable button widget (CustomButton in widgets/)
5. ✅ Material Design and Cupertino Widgets implementation (LearnPage)
6. ✅ Two-page app with Drawer and BottomNavigationBar (HomePage)
7. ✅ Widget tree hierarchy (see Widget Tree Diagram below)
8. ✅ Refactored widgets into smaller reusable components
9. ✅ Third-party package integration (flutter_staggered_grid_view)
10. ✅ Project documentation (this README)

### Second Activity Tasks
1. ✅ Three Text widgets in Row with equal spacing
2. ✅ Two buttons in Column, centered
3. ✅ Container with padding, margin, and background color
4. ✅ Profile card layout with Row and Column
5. ✅ Responsive layout using Expanded
6. ✅ Navigation bar using Row with icons
7. ✅ Stack layout with background and floating button
8. ✅ Flexible widget for dynamic resizing
9. ✅ Chat bubble UI with Container styling
10. ✅ Grid-like layout using Row and Column

## Widget Tree Diagram

\`\`\`
SignLanguageApp (MaterialApp)
└── HomePage (StatefulWidget)
    ├── AppBar
    ├── Drawer
    │   └── ListView
    │       ├── DrawerHeader
    │       └── ListTile (x2)
    ├── Body (SingleChildScrollView)
    │   └── Column
    │       ├── Row (Three Text widgets)
    │       ├── Column (Two CustomButtons)
    │       ├── Container (Welcome message)
    │       ├── ProfileCard
    │       │   └── Column
    │       │       ├── Row (Avatar + Name)
    │       │       └── Column (Details)
    │       ├── Row (Expanded containers)
    │       ├── NavigationBarWidget (Row with icons)
    │       ├── StackLayoutWidget
    │       │   └── Stack
    │       │       ├── Container (Background)
    │       │       ├── Text (Center)
    │       │       └── FloatingActionButton
    │       ├── FlexibleLayoutWidget
    │       │   └── Column (Flexible children)
    │       ├── ChatBubbleWidget
    │       │   └── Column (Chat bubbles)
    │       └── GridLikeLayout
    │           └── Column
    │               └── Row (x2)
    └── BottomNavigationBar
\`\`\`

### Parent-Child Hierarchy Explanation

- **MaterialApp** is the root widget that provides Material Design
- **HomePage** is a StatefulWidget that manages navigation state
- **Scaffold** provides the basic app structure (AppBar, Drawer, Body, BottomNavigationBar)
- **SingleChildScrollView** allows the content to scroll
- **Column** arranges children vertically
- **Row** arranges children horizontally
- **Container** provides styling (padding, margin, colors)
- **Stack** layers widgets on top of each other
- **Expanded/Flexible** make children responsive to available space

## Features

- Learn sign language alphabet
- Practice numbers in sign language
- Study common greetings and phrases
- Track learning progress
- Material Design and iOS-style (Cupertino) interfaces

## How to Use in FlutLab.io

1. Create a new Flutter project in FlutLab.io
2. Copy all files from this project to your FlutLab project
3. Make sure to create the folder structure: models/, views/, widgets/, services/
4. Run the app in FlutLab's preview

## Dependencies

- flutter_staggered_grid_view: ^0.7.0 - For creating staggered grid layouts

## Getting Started

Run the app and explore:
- Use the Drawer menu to navigate
- Use the BottomNavigationBar to switch between Home and Learn
- Toggle between Material and Cupertino design in the Learn page
- Explore different sign language lessons
