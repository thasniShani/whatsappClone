import 'package:flutter/material.dart';

import 'package:whatsapp/status/statusModel.dart';
import 'package:whatsapp/status/statusTile.dart';

// ignore: must_be_immutable
class StatusScreen extends StatelessWidget {
  StatusScreen({Key? key}) : super(key: key);
  List<StatusModel> statusList = [
    StatusModel(
      avatar: '',
      date: 'july 19',
      updatedAt: '2.45 P M',
      name: 'Surya',
    ),
    StatusModel(
      avatar: '',
      date: 'july 19',
      updatedAt: '2.45 P M',
      name: 'AlluArjun',
    ),
    StatusModel(
      avatar: '',
      date: 'july 19',
      updatedAt: '2.45 P M',
      name: 'Prabas',
    ),
    StatusModel(
      avatar: '',
      date: 'july 19',
      updatedAt: '2.45 P M',
      name: 'AmirKhan',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        ListTile(
          leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey,
              child: Positioned(
                bottom: 0.0,
                right: 1.0,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )),
          title: const Text('My status'),
          subtitle: const Text('Tap to add status update'),
        ),
        const Text('Recent updates'),
        // Column(
        //   children: [
        //     ListView.builder(
        //       itemCount: statusList.length,
        //       itemBuilder: (BuildContext context, int index) {
        //         //specific location(context)
        //         return StatusTile(
        //           statusData: statusList[index],
        //         );
        //       },
        //     ),
        //   ],
        // ),
        const Text('Viewed updates'),
        // Column(
        //   children: [
        //     ListView.builder(
        //       itemCount: statusList.length,
        //       itemBuilder: (BuildContext context, int index) {
        //         return StatusTile(statusData: statusList[index]);
        //       },
        //     ),
        //   ],
        // ),
        const Text('Muted updates'),
        // Column(
        //   children: [
        //     ListView.builder(
        //       itemCount: statusList.length,
        //       itemBuilder: (BuildContext context, int index) {
        //         return StatusTile(statusData: statusList[index]);
        //       },
        //     ),
        //   ],
        // ),
      ]),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            mini: true,
            backgroundColor: const Color(0xFFD6D6D6),
            onPressed: () {},
            child: const Icon(Icons.create),
          ),
          const SizedBox(
            height: 25,
          ),
          FloatingActionButton(
            backgroundColor: const Color(0xFF3B7A57),
            onPressed: () {},
            child: const Icon(
              Icons.camera_alt,
            ),
          ),
        ],
      ),
    );
  }
}
