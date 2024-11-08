import 'package:flutter/material.dart';
import 'package:websocket/model/chat_model.dart';
import 'package:websocket/pages/invidual_page.dart';

class CustomCard extends StatelessWidget {
  final ChatModel chatModel;
  const CustomCard({super.key, required this.chatModel});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>InvidualPage(chatmodel: chatModel,)));
      },
      child:  Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              child: Icon(chatModel.icon),
            ),
            trailing: Text(chatModel.time!),
            title: Text(chatModel.name!,style: TextStyle(
              fontSize: 16,fontWeight: FontWeight.bold
            ),),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(width: 5,), 
                Text(chatModel.currentMessage!,style: TextStyle(
                  fontSize: 13
                ),),
                
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20,left: 80),
            child: Divider(thickness: 1,),
          )
        ],
      ),
    );
  }
}