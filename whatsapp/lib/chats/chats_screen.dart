import 'package:flutter/material.dart';
import 'package:whatsapp/chats/chatTile.dart';
import 'package:whatsapp/chats/models/chatModel.dart';

// ignore: must_be_immutable
class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);
  List<ChatModel> chatList = [
    ChatModel(
      avatar:
          'https://www.ritzmagazine.in/wp-content/uploads/2021/09/Actor-Surya-appeals-to-students-to-be-bold-and-confident.jpg',
      isGroup: false,
      message: 'hello',
      name: 'Surya',
      updatedAt: '9 AM',
    ),
    ChatModel(
      avatar: '',
      isGroup: false,
      message: 'hi',
      name: 'Vijay',
      updatedAt: '4 PM',
    ),
    ChatModel(
      avatar:
          'https://www.nicepng.com/png/detail/131-1318812_avatar-group-icon.png',
      isGroup: true,
      message: 'hi frnz',
      name: 'Vijay fans',
      updatedAt: '2.40 PM',
    ),
    ChatModel(
      avatar: '',
      isGroup: true,
      message: 'hi fans',
      name: 'surya fans',
      updatedAt: '4 PM',
    ),
    ChatModel(
      avatar:
          'https://static.toiimg.com/thumb/61472067.cms?width=170&height=240',
      isGroup: false,
      message: 'hi',
      name: 'Vijay',
      updatedAt: '1 PM',
    ),
    ChatModel(
      avatar: 'https://static.toiimg.com/photo/msid-91563921/91563921.jpg',
      isGroup: false,
      message: 'hi',
      name: 'Vikram',
      updatedAt: '2 PM',
    ),
    ChatModel(
      avatar:
          'https://pbs.twimg.com/profile_images/1422783014510096385/AllmR7nC_400x400.jpg',
      isGroup: false,
      message: 'hi',
      name: 'Ajith',
      updatedAt: '2 PM',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF3B7A57),
        onPressed: () {},
        child: const Icon(Icons.chat),
      ),
      body: ListView.builder(
        //multiple items
        itemCount: chatList.length,
        itemBuilder: (BuildContext context, int index) {
          return ChatTile(
            chatData: chatList[index],
          );
        },
      ),
    );
  }
}
