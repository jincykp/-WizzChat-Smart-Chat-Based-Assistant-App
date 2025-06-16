import 'package:flutter/material.dart';

class UpdatesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Stack(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person, color: Colors.white),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Color(0xFF2196F3),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Icon(Icons.add, color: Colors.white, size: 12),
                ),
              ),
            ],
          ),
          title: Text('My Status'),
          subtitle: Text('Tap to add status update'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Recent updates',
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: Text('Contact ${index + 1}'),
                subtitle: Text('${index + 1} hour ago'),
              );
            },
          ),
        ),
      ],
    );
  }
}

// Data Models
class ChatItem {
  final String name;
  final String lastMessage;
  final String time;
  final int unreadCount;
  final String profileImage;
  final bool isGroup;

  ChatItem({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.unreadCount,
    required this.profileImage,
    this.isGroup = false,
  });
}

class CallItem {
  final String name;
  final String time;
  final CallType type;
  final bool isVideo;

  CallItem({
    required this.name,
    required this.time,
    required this.type,
    required this.isVideo,
  });
}

enum CallType { incoming, outgoing, missed }
