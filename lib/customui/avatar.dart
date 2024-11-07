import 'package:flutter/material.dart';
import 'package:websocket/model/chat_model.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key, required this.contact});
 final ChatModel contact;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 10),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 25,
                child: Icon(Icons.person),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 11,
                  child: Icon(Icons.clear,color: Colors.white,size: 18,)),
              )
            ],
          ),
          Text(contact.name!)
        ],
      ),
    );
  }
}