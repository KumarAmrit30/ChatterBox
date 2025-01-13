# ChatterBox
ChatterBox is a real-time messaging application developed using Flutter and Firebase. It offers a communal chat platform where users can exchange text messages, images, and videos seamlessly. The app leverages Firebase services for authentication, data storage, and media handling, ensuring a robust and scalable backend infrastructure.

# Features
• Real-Time Messaging: Instant exchange of messages among users.
• Media Sharing: Support for sending images and videos.
• User Authentication: Secure login and registration using Firebase Authentication.
• Persistent Storage: Firebase Storage: Handles storage and retrieval of media files.
• Responsive UI: Adaptive design compatible with various device sizes.

# Technical Details
• State Management: Utilizes Flutter's Provider package for efficient state management.
• Form Validation: Implements form validation using Flutter's built-in validation techniques.
• Asynchronous Operations: Employs Dart's async and await for handling asynchronous tasks.
• Image and Video Handling: Integrates image_picker for media selection and firebase_storage for uploading media files.
• Real-Time Data Sync: Uses Firebase Realtime Database listeners to update chat data in real-time.
• Error Handling: Comprehensive error handling to manage authentication errors, network issues, and data retrieval exceptions.

# Prerequisites
• Flutter SDK: Ensure Flutter is installed on your development machine.
• Firebase Account: Set up a Firebase project with Authentication, Realtime Database, and Storage enabled.

# Getting Started
1. Clone the Repository:
 • git clone https://github.com/KumarAmrit30/ChatterBox.git
2. Navigate to the Project Directory:
 • cd ChatterBox
3. Install Dependencies:
 • flutter pub get
4. Configure Firebase:
 • Android: Place the google-services.json file in the android/app directory.
 • iOS: Place the GoogleService-Info.plist file in the ios/Runner directory.
5. Run the Application:
 • flutter run

# Project Structure
lib/
├── main.dart             # Application entry point
├── models/               # Data models
├── screens/              # UI screens
├── services/             # Firebase interaction services
├── utils/                # Utility functions and constants
└── widgets/              # Reusable UI components

# Dependencies
 • Firebase Core: firebase_core
 • Firebase Authentication: firebase_auth
 • Firebase Realtime Database: firebase_database
 • Firebase Storage: firebase_storage
 • Provider: provider
 • Image Picker: image_picker

# License
ChatterBox is licensed under the GNU General Public License v3.0. See the LICENSE file for details.

# Contact
Developed by GoConqueror. For inquiries or collaboration, feel free to reach out.
