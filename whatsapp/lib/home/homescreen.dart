import 'package:flutter/material.dart';
import 'package:whatsapp/calls/callsScreen.dart';
import 'package:whatsapp/camera/cameraScreen.dart';
import 'package:whatsapp/chats/chats_screen.dart';
import 'package:whatsapp/status/status_Screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('whatsapp'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          PopupMenuButton(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 1,
                  child: Text('New Group'),
                ),
                const PopupMenuItem(
                  child: Text('New Broadcast'),
                ),
                const PopupMenuItem(
                  child: Text('Linked Devices'),
                ),
                const PopupMenuItem(
                  child: Text('Starred Messages'),
                ),
                const PopupMenuItem(
                  child: Text('Payments'),
                ),
                const PopupMenuItem(
                  child: Text('Settings'),
                ),
              ];
            },
          )
        ],
        bottom: TabBar(
          controller: _controller,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.camera_alt,
              ),
            ),
            Tab(
              text: 'CHATS',
            ),
            Tab(
              text: 'STATUS',
            ),
            Tab(
              text: 'CALLS',
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          CameraPage(),
          ChatScreen(),
          StatusScreen(),
          CallScreen(),
        ],
      ),
    );
  }
}
