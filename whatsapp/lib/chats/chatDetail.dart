import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp/chats/models/chatModel.dart';
import 'package:whatsapp/chats/models/singleMessage.dart';
import 'package:whatsapp/chats/widgets/chatBubble.dart';
import 'package:whatsapp/chats/widgets/popupbox.dart';

class ChatDetailScreen extends StatefulWidget {
  ChatDetailScreen({Key? key, required this.chatDetails}) : super(key: key);
  final ChatModel chatDetails;

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  bool? isSend = false;
  final TextEditingController _msgController = TextEditingController(text: '');
  bool emojiShow = false;
  final FocusNode _focusNode = FocusNode();
  List<MessageModel> messages = [
    MessageModel(
        isSend: true, isReaded: true, sendAt: '9.A M', message: 'hello'),
    MessageModel(
        isSend: false, isReaded: true, sendAt: '10.A M', message: 'hi'),
    MessageModel(
        isSend: true,
        isReaded: true,
        sendAt: '10.5A M',
        message: 'where are you?'),
    MessageModel(
        isSend: false,
        isReaded: false,
        sendAt: '10.10 A M',
        message: 'At Calicut'),
    MessageModel(
        isSend: true, isReaded: false, sendAt: '11.15 A M', message: 'why?'),
  ];
  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 3,
        leadingWidth: 92,
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
            CircleAvatar(
                backgroundImage: (widget.chatDetails.avatar == '')
                    ? (AssetImage((widget.chatDetails.isGroup!
                        ? 'assets/images/group.png'
                        : 'assets/images/person.jpeg')))
                    : NetworkImage(widget.chatDetails.avatar!)
                        as ImageProvider),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.chatDetails.name.toString()),
            Text(
              'LastSeen Today at${widget.chatDetails.updatedAt}',
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          const Icon(Icons.video_call),
          const Icon(Icons.call),
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(
                  child: Text(widget.chatDetails.isGroup!
                      ? 'Group info'
                      : 'View Contact')),
              PopupMenuItem(
                  child: Text(widget.chatDetails.isGroup!
                      ? 'Group media'
                      : 'Media, links,and docs')),
              const PopupMenuItem(child: Text('Search')),
              const PopupMenuItem(child: Text('Disappearing messages')),
              const PopupMenuItem(child: Text('Mute notifications')),
              const PopupMenuItem(child: Text('Wallpaper')),
              const PopupMenuItem(child: Text('More'))
            ];
          }),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/bg.jpeg',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
            ),
            ListView.builder(
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                return ChatBubble(
                  msg: messages[index],
                );
              },
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 60,
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: TextField(
                              focusNode: _focusNode,
                              controller: _msgController,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  setState(() {
                                    isSend = true;
                                  });
                                } else {
                                  setState(() {
                                    isSend = false;
                                  });
                                }
                              },
                              decoration: InputDecoration(
                                  prefixIcon: IconButton(
                                      onPressed: () {
                                        // _focusNode.unfocus();

                                        setState(() {
                                          emojiShow = !emojiShow;
                                        });
                                      },
                                      icon: Icon((emojiShow)
                                          ? Icons.keyboard
                                          : Icons.emoji_emotions)),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          showModalBottomSheet(
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (context) => PopupBox());
                                        },
                                        icon: const Icon(
                                          Icons.attach_file,
                                        ),
                                      ),
                                      const Icon(Icons.currency_rupee),
                                      const Icon(Icons.camera_alt),
                                      const SizedBox(
                                        width: 5,
                                      )
                                    ],
                                  ),
                                  hintText: 'Message'),
                            ),
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            String tdata =
                                DateFormat("hh:mm a").format(DateTime.now());
                            setState(() {
                              messages.add(MessageModel(
                                  isReaded: false,
                                  isSend: true,
                                  message: _msgController.text,
                                  sendAt: tdata));
                              _msgController.clear();
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon((isSend!) ? Icons.send : Icons.mic),
                          ),
                        ),
                      ],
                    ),
                    emojiShow == true ? selectEmoji() : Container()
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget selectEmoji() {
    return EmojiPicker(
      onEmojiSelected: (emoji, category) {
        _msgController.text = _msgController.text + emoji.emoji;
      },
    );
  }
}
