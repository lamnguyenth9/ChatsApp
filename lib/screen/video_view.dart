import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  const VideoView({super.key, required this.path});
  final String path;

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
 late VideoPlayerController _controller;
 @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.path ))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.crop_rotate,
                size: 27,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.emoji_emotions_outlined,
                size: 27,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.title,
                size: 27,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                size: 27,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height-150,
              child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(child: Text("1"),),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width:  MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                child: TextFormField(
                  maxLines: 6,
                  minLines: 1,
                  style:  const TextStyle(
                      color: Colors.white,
                      fontSize: 17
                    ),
                  decoration:  InputDecoration(
                    hintText: "Add caption....",
                    suffixIcon: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      radius: 27,
                      child: const Icon(Icons.check,color: Colors.white,),
                    ),
                    prefixIcon: const Icon(Icons.add_a_photo,color: Colors.white,size: 27,),
                    border: InputBorder.none,
                    hintStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 17
                    )
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: (){
                  setState(() {
                    _controller.value.isPlaying?_controller.pause():_controller.play();
                  });
                },
                child: Icon(
                  _controller.value.isPlaying?Icons.pause:Icons.play_arrow,
                  color: Colors.white,size: 50,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
