import 'package:flutter/material.dart';
import 'package:wizzchat/views/home_screen.dart';
import 'package:wizzchat/views/update_screen.dart';

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
