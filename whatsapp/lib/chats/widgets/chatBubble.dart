import 'package:flutter/material.dart';
import 'package:whatsapp/chats/models/singleMessage.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({Key? key, required this.msg}) : super(key: key);
  final MessageModel msg;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: msg.isSend! ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 150,
        ),
        child: Card(
          color: Colors.white,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 5, right: 30, top: 7, bottom: 20),
                child: Text(msg.message.toString()),
              ),
              Positioned(
                bottom: 4,
                right: 2,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      msg.sendAt!,
                      style: const TextStyle(fontSize: 10),
                    ),
                   Icon(
                          Icons.done_all,
                          size: 15,
                          color: msg.isReaded!? Colors.blue : Colors.grey,
                        ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
