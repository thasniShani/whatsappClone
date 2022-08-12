import 'package:flutter/material.dart';
import 'package:whatsapp/calls/callsModel.dart';

class CallDetailScreen extends StatelessWidget {
  const CallDetailScreen({Key? key, required this.callDetails})
      : super(key: key);
  final CallsModel callDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 3,
        leadingWidth: 90,
        leading: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            const SizedBox(
              width: 1,
            ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Call info'),
          ],
        ),
        actions: [
          const Icon(Icons.message),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                const PopupMenuItem(child: Text('Remove from call log')),
                const PopupMenuItem(child: Text('Block')),
              ];
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
                backgroundImage: (callDetails.avatar == '')
                    ? (AssetImage((callDetails.isGroup
                        ? 'assets/images/group.png'
                        : 'assets/images/person.jpeg')))
                    : NetworkImage(callDetails.avatar) as ImageProvider),
            title: Text(
              callDetails.name.toString(),
            ),
            subtitle: const Text('status'),
            trailing: Row(
              children: const [
                Icon(Icons.call),
                Icon(Icons.video_call),
              ],
            ),
          ),
          Column(
            children: [
              const Expanded(child: Divider()),
              Text(
                callDetails.date,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const ListTile(
            leading: Icon(Icons.call_received, color: Colors.green),
            title: Text('Incoming'),
            subtitle: Text(
              '8:25 PM',
              style: TextStyle(color: Colors.grey),
            ),
            trailing:
                Text('5.44\n5.0 MB', style: TextStyle(color: Colors.grey)),
          ),
          const ListTile(
            leading: Icon(Icons.call_made, color: Colors.green),
            title: Text('Outgoing'),
            subtitle: Text(
              '7:00 AM',
              style: TextStyle(color: Colors.grey),
            ),
            trailing: Text('Unavailable', style: TextStyle(color: Colors.grey)),
          ),
          const ListTile(
            leading: Icon(
              Icons.call_made,
              color: Colors.green,
            ),
            title: Text('Outgoing'),
            subtitle: Text(
              '9:01 PM',
              style: TextStyle(color: Colors.grey),
            ),
            trailing:
                Text('Call declained', style: TextStyle(color: Colors.grey)),
          ),
          const ListTile(
            leading: Icon(
              Icons.call_missed,
              color: Colors.red,
            ),
            title: Text('Missed'),
            subtitle: Text(
              '8:25 PM',
              style: TextStyle(color: Colors.grey),
            ),
            trailing:
                Text('5.44\n5.0 MB', style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
