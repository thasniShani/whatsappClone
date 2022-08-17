import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras = [];

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _cameraController;
  Future<void>? cameraValue;
  int changeCamera = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController =
        CameraController(cameras[changeCamera], ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_cameraController);
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ),
        Positioned(
          bottom: 0.0,
          child: Padding(
            padding: const EdgeInsets.all(45.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 55,top: 30),
                  child: IconButton(onPressed: (){}, icon:const Icon(Icons.flash_off,size: 25,color: Colors.white,)),
                ),
                
                IconButton(
                    onPressed: () {
                      setState(() {
                        changeCamera = changeCamera == 0 ? 1 : 0;
                        CameraController(cameras[changeCamera], ResolutionPreset.high);
        
                        cameraValue = _cameraController.initialize();
                      });
                    },
                  
                    icon: const Icon(
                      Icons.panorama_fish_eye,
                      color: Colors.white,
                      size: 75,
                    )),
                    
                    Padding(
                      padding: const EdgeInsets.only(left: 95,top: 22),
                      child: IconButton(onPressed: (){}, icon:const Icon(Icons.flip_camera_ios,size: 25,color: Colors.white,)),
                    ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
