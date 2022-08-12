import 'package:flutter/material.dart';
import 'package:whatsapp/calls/callDetails.dart';
import 'package:whatsapp/calls/callsModel.dart';

class CallTile extends StatelessWidget {
  const CallTile({Key? key, required this.callData}) : super(key: key);
  final CallsModel callData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CallDetailScreen(callDetails: callData),
          ),
        );
      },
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: (callData.avatar == '')
            ? AssetImage((callData.isGroup)
                ? 'assets/images/group.png'
                : 'assets/images/person.jpeg')
            : NetworkImage(callData.avatar) as ImageProvider,
      ),
      title: Text(callData.name),
      subtitle: Row(
        children: [
          const Icon(
            Icons.call_received_outlined,
            color: Colors.red,
          ),
          Text(
            '${callData.date} , ${callData.updatedAt}',
          ),
        ],
      ),
      trailing: (callData.callType == true)
          ? const Icon(
              Icons.video_call_rounded,
              color: Colors.green,
            )
          : const Icon(
              Icons.call,
              color: Colors.green,
            ),
    );
  }
}
