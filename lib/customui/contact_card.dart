import 'package:flutter/material.dart';
import 'package:websocket/model/chat_model.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.chat});
  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 53,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 25,
              child: Icon(Icons.person),
            ),
          chat.select?  Positioned(
              bottom: 4,
              right: 5,
              child: CircleAvatar(
                backgroundColor: Colors.teal,
                radius: 11,
                child: Icon(Icons.check,color: Colors.white,size: 18,)),
            ):Container()
          ],
        ),
      ),
      title: Text(chat.name!,style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold
      ),),
      subtitle: Text(chat.status!),
    );
  }
}