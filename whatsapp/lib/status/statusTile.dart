import 'package:flutter/material.dart';
import 'package:whatsapp/status/statusModel.dart';

class StatusTile extends StatelessWidget {
  const StatusTile({Key? key, required this.statusData}) : super(key: key);
  final StatusModel statusData;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 25,
        backgroundColor: Colors.grey,
        child: Icon(Icons.person),
      ),
      title: Text(statusData.name!),
      subtitle: Text(statusData.date!),
      trailing: Text(statusData.updatedAt!),
    );
  }
}
