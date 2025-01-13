# ChatterBox
ChatterBox is a real-time messaging application developed using Flutter and Firebase. It offers a communal chat platform where users can exchange text messages, images, and videos seamlessly. The app leverages Firebase services for authentication, data storage, and media handling, ensuring a robust and scalable backend infrastructure.

# Features
 • Real-Time Messaging: Instant exchange of messages among users.<br>
 • Media Sharing: Support for sending images and videos.<br>
 • User Authentication: Secure login and registration using Firebase Authentication.<br>
 • Persistent Storage: Firebase Storage: Handles storage and retrieval of media files.<br>
 • Responsive UI: Adaptive design compatible with various device sizes.<br>

# Technical Details
• State Management: Utilizes Flutter's Provider package for efficient state management.<br>
• Form Validation: Implements form validation using Flutter's built-in validation techniques.<br>
• Asynchronous Operations: Employs Dart's async and await for handling asynchronous tasks.<br>
• Image and Video Handling: Integrates image_picker for media selection and firebase_storage for uploading media files.<br>
• Real-Time Data Sync: Uses Firebase Realtime Database listeners to update chat data in real-time.<br>
• Error Handling: Comprehensive error handling to manage authentication errors, network issues, and data retrieval exceptions.<br>

# Prerequisites
• Flutter SDK: Ensure Flutter is installed on your development machine.<br>
• Firebase Account: Set up a Firebase project with Authentication, Realtime Database, and Storage enabled.<br>

# Getting Started
1. Clone the Repository:<br>
 • git clone https://github.com/KumarAmrit30/ChatterBox.git<br>
2. Navigate to the Project Directory:<br>
 • cd ChatterBox<br>
3. Install Dependencies:<br>
 • flutter pub get<br>
4. Configure Firebase:<br>
 • Android: Place the google-services.json file in the android/app directory.<br>
 • iOS: Place the GoogleService-Info.plist file in the ios/Runner directory.<br>
5. Run the Application:<br>
 • flutter run<br>

# Project Structure
lib/<br>
├── main.dart             # Application entry point<br>
├── models/               # Data models<br>
├── screens/              # UI screens<br>
├── services/             # Firebase interaction services<br>
├── utils/                # Utility functions and constants<br>
└── widgets/              # Reusable UI components<br>

# Dependencies
 • Firebase Core: firebase_core<br>
 • Firebase Authentication: firebase_auth<br>
 • Firebase Realtime Database: firebase_database<br>
 • Firebase Storage: firebase_storage<br>
 • Provider: provider<br>
 • Image Picker: image_picker<br>

# License
ChatterBox is licensed under the GNU General Public License v3.0. See the LICENSE file for details.<br>

# Contact
Developed by GoConqueror. For inquiries or collaboration, feel free to reach out.<br>
