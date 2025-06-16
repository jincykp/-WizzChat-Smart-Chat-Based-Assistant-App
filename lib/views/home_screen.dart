import 'package:flutter/material.dart';
import 'package:wizzchat/views/chat_screen.dart';
import 'package:wizzchat/views/update_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WizzChat Users'),
        actions: [
          IconButton(icon: Icon(Icons.camera_alt_outlined), onPressed: () {}),
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(child: Text('New group'), value: 'new_group'),
              PopupMenuItem(
                child: Text('New broadcast'),
                value: 'new_broadcast',
              ),
              PopupMenuItem(
                child: Text('Linked devices'),
                value: 'linked_devices',
              ),
              PopupMenuItem(child: Text('Starred messages'), value: 'starred'),
              PopupMenuItem(child: Text('Settings'), value: 'settings'),
            ],
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white, // Color of the line below the tab
          labelColor: Colors.white,
          tabs: [
            Tab(text: 'CHATS'),
            Tab(text: 'CALLS'),
            Tab(text: 'UPDATES'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [ChatsScreen(), CallsScreen(), UpdatesScreen()],
      ),
    );
  }
}

class ChatListTile extends StatelessWidget {
  final ChatItem chat;

  const ChatListTile({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.grey[300],
        child: chat.isGroup
            ? Icon(Icons.group, color: Colors.white)
            : Icon(Icons.person, color: Colors.white),
      ),
      title: Text(
        chat.name,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      ),
      subtitle: Text(
        chat.lastMessage,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.grey[600], fontSize: 14),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            chat.time,
            style: TextStyle(
              color: chat.unreadCount > 0
                  ? Color(0xFF2196F3)
                  : Colors.grey[600],
              fontSize: 12,
              fontWeight: chat.unreadCount > 0
                  ? FontWeight.w500
                  : FontWeight.normal,
            ),
          ),
          SizedBox(height: 4),
          if (chat.unreadCount > 0)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Color(0xFF2196F3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                chat.unreadCount.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
      onTap: () {
        // Handle chat tap
        print('Tapped on ${chat.name}');
      },
    );
  }
}

class CallsScreen extends StatelessWidget {
  final List<CallItem> _calls = [
    CallItem(
      name: 'John Doe',
      time: '10 minutes ago',
      type: CallType.incoming,
      isVideo: false,
    ),
    CallItem(
      name: 'Alice Smith',
      time: '25 minutes ago',
      type: CallType.outgoing,
      isVideo: true,
    ),
    CallItem(
      name: 'Bob Johnson',
      time: '1 hour ago',
      type: CallType.missed,
      isVideo: false,
    ),
    CallItem(
      name: 'Sarah Wilson',
      time: 'Yesterday',
      type: CallType.outgoing,
      isVideo: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _calls.length,
      itemBuilder: (context, index) {
        final call = _calls[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: Text(call.name),
          subtitle: Row(
            children: [
              Icon(
                call.type == CallType.incoming
                    ? Icons.call_received
                    : call.type == CallType.outgoing
                    ? Icons.call_made
                    : Icons.call_received,
                size: 16,
                color: call.type == CallType.missed ? Colors.red : Colors.green,
              ),
              SizedBox(width: 4),
              Text(call.time),
            ],
          ),
          trailing: Icon(
            call.isVideo ? Icons.videocam : Icons.call,
            color: Color(0xFF1976D2),
          ),
        );
      },
    );
  }
}
