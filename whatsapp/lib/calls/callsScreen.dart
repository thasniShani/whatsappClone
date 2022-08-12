import 'package:flutter/material.dart';
import 'package:whatsapp/calls/callsModel.dart';
import 'package:whatsapp/calls/callsTile.dart';

// ignore: must_be_immutable
class CallScreen extends StatelessWidget {
  CallScreen({Key? key}) : super(key: key);
  List<CallsModel> callList = [
    CallsModel(
      avatar:
          'https://www.tollywood.net/wp-content/uploads/2022/01/Suryas-1st-pan-india-movie.jpg',
      name: 'Surya fans',
      date: 'today',
      updatedAt: '1:08 AM',
      isGroup: true,
      callType: false,
      calllist:''
    ),
    CallsModel(
      avatar: '',
      name: 'jaySurya',
      date: 'today',
      updatedAt: '2:30 PM',
      isGroup: false,
      callType: true,
      calllist:''
    ),
    CallsModel(
      avatar:
          'https://upload.wikimedia.org/wikipedia/commons/e/e3/Suriya2011.jpg',
      name: 'Surya',
      date: 'yesterday',
      updatedAt: '1:52 AM',
      isGroup: false,
      callType: false,
      calllist:''
    ),
    CallsModel(
      avatar:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Vijay_Deverakonda_at_NOTA_pressmeet_%28cropped%29.jpg/800px-Vijay_Deverakonda_at_NOTA_pressmeet_%28cropped%29.jpg',
      name: 'vijay',
      date: 'july 22',
      updatedAt: '10:01 AM',
      isGroup: false,
      callType: true,
      calllist: ''
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF3B7A57),
          onPressed: () {},
          child: const Icon(Icons.add_ic_call)),
      body: ListView.builder(
        itemCount: callList.length,
        itemBuilder: (BuildContext context, int index) {
          return CallTile(
            callData: callList[index],
          );
        },
      ),
    );
  }
}
