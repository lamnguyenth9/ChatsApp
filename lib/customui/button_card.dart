import 'package:flutter/material.dart';
import 'package:websocket/model/chat_model.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({super.key, required this.name, required this.icon, });
  final String name;
  final IconData icon;
  

  @override
  Widget build(BuildContext context) {
    return InkWell (
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 25,
          child: Icon(icon,color: Colors.white,),
        ),
        title: Text(name,style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold
        ),),
        
      ),
    );
  }
}