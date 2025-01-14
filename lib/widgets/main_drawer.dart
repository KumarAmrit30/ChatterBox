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
            // padding: const EdgeInsets.all(20),
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
                Expanded(
                  child: Text('Welcome back, $username!',
                      style: Theme.of(context).textTheme.titleLarge),
                ),
              ],
            ),
            // Row(
            //   children: [
            //     // Display user image if available
            //     CircleAvatar(
            //       radius: 30, // Adjust the size of the avatar
            //       backgroundImage: userImageUrl.isNotEmpty
            //           ? NetworkImage(
            //               userImageUrl) // Display the image if available
            //           : null,
            //       child: userImageUrl.isEmpty
            //           ? Icon(
            //               Icons.person, // Show a default icon if no image
            //               size: 30,
            //               color: Theme.of(context).colorScheme.primary,
            //             )
            //           : null,
            //     ),
            //     const SizedBox(width: 10),
            //     // Display username
            //     Text(
            //       username,
            //       style: Theme.of(context).textTheme.titleLarge!.copyWith(
            //             color: Theme.of(context).colorScheme.primary,
            //             fontWeight: FontWeight.bold,
            //             fontSize: 32,
            //           ),
            //     ),
            //   ],
            // ),
          ),
          // ListTile(
          //   leading: IconButton(
          //     onPressed: () {},
          //     icon: const Icon(Icons.exit_to_app),
          //     iconSize: 24,
          //   ),
          //   title: const Text(
          //     'Logout',
          //     style: TextStyle(fontWeight: FontWeight.bold),
          //   ),
          //   onTap: () {},
          // ),
        ],
      ),
    );
  }
}
