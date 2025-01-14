import 'package:chat_bot/screens/about.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  String username = '';
  String userImageUrl = '';

  void _fetchUsername() async {
    final user = FirebaseAuth.instance.currentUser!;
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    setState(() {
      username = userDoc.data()!['username'];
      userImageUrl = userDoc.data()!['image_url'];
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: userImageUrl.isNotEmpty
                      ? NetworkImage(userImageUrl)
                      : null,
                  child: userImageUrl.isEmpty
                      ? Icon(
                          Icons.person,
                          size: 30,
                          color: Theme.of(context).colorScheme.primary,
                        )
                      : null,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Welcome back, $username!',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text('Chats'),
            onTap: () {
              // Navigate to Chats screen
              const SnackBar(
                content: Text('Chats feature is coming soon!'),
                duration:
                    Duration(seconds: 2), // Message disappears after 2 seconds
                behavior: SnackBarBehavior
                    .floating, // Optional: makes the snackbar float
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text('Groups'),
            onTap: () {
              // Navigate to Groups screen
              const SnackBar(
                content: Text('Groups feature is coming soon!'),
                duration:
                    Duration(seconds: 2), // Message disappears after 2 seconds
                behavior: SnackBarBehavior
                    .floating, // Optional: makes the snackbar float
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Friends'),
            onTap: () {
              // Navigate to Friends screen
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Friends feature is coming soon!'),
                  duration: Duration(
                      seconds: 2), // Message disappears after 2 seconds
                  behavior: SnackBarBehavior
                      .floating, // Optional: makes the snackbar float
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap: () {
              // Navigate to Notifications screen
              const SnackBar(
                content: Text('Notifications feature is coming soon!'),
                duration:
                    Duration(seconds: 2), // Message disappears after 2 seconds
                behavior: SnackBarBehavior
                    .floating, // Optional: makes the snackbar float
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorites'),
            onTap: () {
              // Navigate to Favorites screen
              const SnackBar(
                content: Text('Favourites feature is coming soon!'),
                duration:
                    Duration(seconds: 2), // Message disappears after 2 seconds
                behavior: SnackBarBehavior
                    .floating, // Optional: makes the snackbar float
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Navigate to Settings screen
              const SnackBar(
                content: Text('Settings coming soon!'),
                duration:
                    Duration(seconds: 2), // Message disappears after 2 seconds
                behavior: SnackBarBehavior
                    .floating, // Optional: makes the snackbar float
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.help_center),
            title: const Text('Help Center'),
            onTap: () {
              // Navigate to Help Center screen
              const SnackBar(
                content: Text('Help Center coming soon!'),
                duration:
                    Duration(seconds: 2), // Message disappears after 2 seconds
                behavior: SnackBarBehavior
                    .floating, // Optional: makes the snackbar float
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.feedback),
            title: const Text('Feedback'),
            onTap: () {
              // Navigate to Feedback screen
              const SnackBar(
                content: Text('Feedback feature is coming soon!'),
                duration:
                    Duration(seconds: 2), // Message disappears after 2 seconds
                behavior: SnackBarBehavior
                    .floating, // Optional: makes the snackbar float
              );
            },
          ),
          ListTile(
  leading: const Icon(Icons.info),
  title: const Text('About'),
  onTap: () {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AboutScreen(),
      ),
    );
  },
),

          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              FirebaseAuth.instance.signOut();
              // Navigate to login screen after logout
            },
          ),
        ],
      ),
    );
  }
}
