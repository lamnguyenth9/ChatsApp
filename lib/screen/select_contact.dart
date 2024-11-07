import 'package:flutter/material.dart';
import 'package:websocket/customui/button_card.dart';
import 'package:websocket/customui/contact_card.dart';
import 'package:websocket/model/chat_model.dart';
import 'package:websocket/screen/Profile.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contact=[
      ChatModel(
        name: "Lam",
        status:"Full stack developer" 
      ),
      ChatModel(
        name: "Laam",
        status:"Flutter developer" 
      ),
      ChatModel(
        name: "Lam",
        status:"Full stack developer" 
      ),
      ChatModel(
        name: "Laam",
        status:"Flutter developer" 
      ),
      ChatModel(
        name: "Lam",
        status:"Full stack developer" 
      ),
      ChatModel(
        name: "Laam",
        status:"Flutter developer" 
      )
    ];
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Contact",style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold
            ),),
            Text("256 contacts",style: TextStyle(
              fontSize: 13
            ),)
          ],
        ),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.search)),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text("Invite a friend"),
                  value: "Invite a friend",
                ),
                PopupMenuItem(
                  child: Text("Contacts"),
                  value: "Contacts",
                ),
                PopupMenuItem(
                  child: Text("Refresh"),
                  value: "Refresh",
                ),
                PopupMenuItem(
                  child: Text("Search"),
                  value: "Search",
                ),
                
              ];
            },
          )
        ],
        backgroundColor: Colors.blue[200],
      ),
      body: ListView.builder(
        itemCount: contact.length+2,
        itemBuilder: (context, index){
          if(index==0){
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>Group()));
              },
              child: ButtonCard(icon: Icons.group,name: "New group",));
          }if(index==1){
            return ButtonCard(icon: Icons.person,name: "New contact",);
          }
          return ContactCard(chat: contact[index-2]);
        })
    );
  }
}