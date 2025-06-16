import 'package:flutter/material.dart';
import 'package:wizzchat/views/home_screen.dart';
import 'package:wizzchat/views/update_screen.dart';

class ChatsScreen extends StatefulWidget {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  // Sample chat data
  final List<ChatItem> _chats = [
    ChatItem(
      name: 'John Doe',
      lastMessage: 'Hey! How are you doing?',
      time: '10:30 AM',
      unreadCount: 3,
      profileImage: 'https://via.placeholder.com/50',
    ),
    ChatItem(
      name: 'Alice Smith',
      lastMessage: 'Can we meet tomorrow?',
      time: '9:45 AM',
      unreadCount: 1,
      profileImage: 'https://via.placeholder.com/50',
    ),
    ChatItem(
      name: 'Bob Johnson',
      lastMessage: 'Thanks for the help!',
      time: 'Yesterday',
      unreadCount: 0,
      profileImage: 'https://via.placeholder.com/50',
    ),
    ChatItem(
      name: 'Family Group',
      lastMessage: 'Mom: Don\'t forget dinner tonight',
      time: 'Yesterday',
      unreadCount: 5,
      profileImage: 'https://via.placeholder.com/50',
      isGroup: true,
    ),
    ChatItem(
      name: 'Sarah Wilson',
      lastMessage: 'Perfect! See you then',
      time: 'Tuesday',
      unreadCount: 0,
      profileImage: 'https://via.placeholder.com/50',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Search Bar
          Container(
            padding: EdgeInsets.all(8.0),
            color: Color(0xFF1976D2),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _isSearching = value.isNotEmpty;
                  });
                },
              ),
            ),
          ),
          // Chat List
          Expanded(
            child: ListView.builder(
              itemCount: _chats.length,
              itemBuilder: (context, index) {
                final chat = _chats[index];
                return ChatListTile(chat: chat);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle new chat action
        },
        backgroundColor: Color(0xFF2196F3),
        child: Icon(Icons.chat, color: Colors.white),
      ),
    );
  }
}
