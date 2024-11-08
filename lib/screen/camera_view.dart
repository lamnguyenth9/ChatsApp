import 'dart:io';

import 'package:flutter/material.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key, required this.path});
  final String path;
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
              child: Image.file(File(path),fit: BoxFit.cover,),
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
            )
          ],
        ),
      ),
    );
  }
}
