import 'package:flutter/material.dart';

class PopupBox extends StatelessWidget {
  const PopupBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          margin: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  iconWidget(
                      icon: const Icon(Icons.insert_drive_file),
                      color: Colors.indigo,
                      text: 'Document'),
                  iconWidget(
                      icon: const Icon(Icons.camera_alt),
                      color: Colors.red,
                      text: 'Camera'),
                  iconWidget(
                      icon: const Icon(Icons.insert_photo),
                      color: Colors.purple,
                      text: 'Gallery'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  iconWidget(
                      icon: const Icon(Icons.headphones),
                      color: Colors.orange,
                      text: 'Audio'),
                  iconWidget(
                      icon: const Icon(Icons.location_pin),
                      color: Colors.greenAccent,
                      text: 'Location'),
                  iconWidget(
                      icon: const Icon(Icons.currency_rupee),
                      color: Colors.green,
                      text: 'Payment'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: iconWidget(
                        icon: const Icon(Icons.person),
                        color: Colors.blue,
                        text: 'Contact'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconWidget({Icon? icon, Color? color, String? text}) {
    return Column(
      children: [
        CircleAvatar(backgroundColor: color, radius: 30, child: icon),
        const SizedBox(
          height: 10,
        ),
        Text(text!),
      ],
    );
  }
}
