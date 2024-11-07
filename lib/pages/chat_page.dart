import 'package:flutter/material.dart';
import 'package:websocket/customui/custom_card.dart';
import 'package:websocket/screen/select_contact.dart';

import '../model/chat_model.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chat=[
    ChatModel(
      name: "lam",
      isGroup: false,
      currentMessage: "hello",
      time: "14:20",
      icon: Icons.person
    ),
    ChatModel(
      name: "Thu",
      isGroup: false,
      currentMessage: "hi",
      time: "14:20",
      icon: Icons.person
    ),
    ChatModel(
      name: "Long",
      isGroup: false,
      currentMessage: "huhu",
      time: "14:20",
      icon: Icons.person
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chat.length,
        itemBuilder: (
        
        BuildContext context, int index) { 
          return CustomCard(chatModel: chat[index],

          );
         },
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>SelectContact()));
        },
        child: Icon(Icons.chat),),
    );
  }
}