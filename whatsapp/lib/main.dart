import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/camera/cameraScreen.dart';
import 'package:whatsapp/home/homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.green,
          appBarTheme: const AppBarTheme(
            color: Color(0xFF3B7A57),
          )),
      home: HomeScreen(),
    );
  }
}
