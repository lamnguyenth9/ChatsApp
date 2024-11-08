import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:websocket/screen/camera_view.dart';
import 'package:websocket/screen/video_view.dart';

late List<CameraDescription> cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _camera;
  late Future<void> cameraValue;
  bool isRecoding = false;
  String videoPath='';
  @override
  void initState() {
    _camera = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = _camera.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _camera.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: cameraValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SizedBox.expand(
                  child: CameraPreview(_camera),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          Positioned(
            bottom: 0,
            // right: 0,
            // left: 0,
            child: Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.flash_off,
                            color: Colors.white,
                            size: 28,
                          )),
                      GestureDetector(
                        onLongPress: () async {
                          
                           await _camera.startVideoRecording();
                          
                          setState(() {
                            
                            isRecoding=true;
                            
                          });
                        },
                        onLongPressUp: ()async {
                          final path = join(
                              (await getTemporaryDirectory()).path,
                              "${DateTime.now()}.mp4");
                        XFile video =  await _camera.stopVideoRecording();
                      await  video.saveTo(path);
                          setState(() {
                            isRecoding=false;
                            videoPath=path;
                          });
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>VideoView(path: videoPath)));
                        },
                        onTap: () {
                          if(!isRecoding)
                          takePhoto(context);
                        },
                        child: isRecoding
                            ? Icon(
                                Icons.radio_button_on,
                                color: Colors.red,
                                size: 80,
                              )
                            : Icon(
                                Icons.panorama_fish_eye,
                                color: Colors.white,
                                size: 70,
                              ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.flip_camera_ios,
                            color: Colors.white,
                            size: 70,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Hold for video, tap for photo",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void takePhoto(BuildContext context) async {
    final path =
        join((await getTemporaryDirectory()).path, "${DateTime.now()}.png");
    XFile picture = await _camera.takePicture();
    picture.saveTo(path);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => CameraView(
                  path: path,
                )));
  }
}
