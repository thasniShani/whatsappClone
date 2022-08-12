import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:whatsapp/chats/chatDetail.dart';
import 'package:whatsapp/chats/models/chatModel.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({Key? key, required this.chatData}) : super(key: key);
  final ChatModel chatData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatDetailScreen(
                      chatDetails: chatData,
                    )));
      }, //it makes clickable text
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          // backgroundColor: Colors.grey,
          // child: Icon(Icons.person),
          backgroundImage: (chatData.avatar == '')
              ? AssetImage((chatData.isGroup!)
                  ? 'assets/images/group.png'
                  : 'assets/images/person.jpeg')
              : NetworkImage(chatData.avatar!) as ImageProvider,
        ),
        title: Text(chatData.name!),
        subtitle: Text(chatData.message!),
        trailing: Text(chatData.updatedAt!),
      ),
    );
  }
}
