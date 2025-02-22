import 'package:chat_bot/widgets/chat_messages.dart';
import 'package:chat_bot/widgets/main_drawer.dart';
import 'package:chat_bot/widgets/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  void setupPushNotification() async {
    final fcm = FirebaseMessaging.instance;
    await fcm.requestPermission();
    fcm.subscribeToTopic('chat');
  }

  @override
  void initState() {
    super.initState();
    setupPushNotification();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chat'),
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app,
                  color: Theme.of(context).colorScheme.primary),
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
            ),
          ],
        ),
        drawer: const MainDrawer(),
        body: const Column(
          children: [
            Expanded(child: ChatMessages(),),
            NewMessage(),
          ],
        ));
  }
}
