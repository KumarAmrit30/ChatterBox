import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble.first({
    super.key,
    required this.userImage,
    required this.username,
    required this.message,
    required this.isMe,
    required this.messageId,
    required this.onDeleteMessage,
  }) : isFirstInSequence = true;

  const MessageBubble.next({
    super.key,
    required this.message,
    required this.isMe,
    required this.messageId,
    required this.onDeleteMessage,
  })  : isFirstInSequence = false,
        userImage = null,
        username = null;

  final bool isFirstInSequence;
  final String? userImage;
  final String? username;
  final String message;
  final bool isMe;
  final String messageId; // Added to identify the message
  final Function(String messageId) onDeleteMessage; // Callback for deletion

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onLongPress: () {
        // Show a dialog or bottom sheet to delete the message
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Delete Message'),
            content: const Text('Are you sure you want to delete this message?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop(); // Close the dialog
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  onDeleteMessage(messageId); // Call delete callback
                  Navigator.of(ctx).pop(); // Close the dialog
                },
                child: const Text('Delete'),
              ),
            ],
          ),
        );
      },
      child: Stack(
        children: [
          if (userImage != null)
            Positioned(
              top: 15,
              right: isMe ? 0 : null,
              child: CircleAvatar(
                backgroundImage: NetworkImage(userImage!),
                backgroundColor: theme.colorScheme.primary.withAlpha(180),
                radius: 23,
              ),
            ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 46),
            child: Row(
              mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    if (isFirstInSequence) const SizedBox(height: 18),
                    if (username != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 13, right: 13),
                        child: Text(
                          username!,
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                        ),
                      ),
                    Container(
                      decoration: BoxDecoration(
                        color: isMe ? Colors.grey[300] : theme.colorScheme.secondary.withAlpha(200),
                        borderRadius: BorderRadius.only(
                          topLeft: !isMe && isFirstInSequence ? Radius.zero : const Radius.circular(12),
                          topRight: isMe && isFirstInSequence ? Radius.zero : const Radius.circular(12),
                          bottomLeft: const Radius.circular(12),
                          bottomRight: const Radius.circular(12),
                        ),
                      ),
                      constraints: const BoxConstraints(maxWidth: 200),
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                      child: Text(
                        message,
                        style: TextStyle(
                          height: 1.3,
                          color: isMe ? Colors.black87 : theme.colorScheme.onSecondary,
                        ),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
