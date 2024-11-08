import 'package:flutter/material.dart';
import 'package:websocket/customui/avatar.dart';
import 'package:websocket/customui/contact_card.dart';
import 'package:websocket/model/chat_model.dart';

class Group extends StatefulWidget {
  const Group({super.key});

  @override
  State<Group> createState() => _GrouptState();
}

class _GrouptState extends State<Group> {
  List<ChatModel> contact = [
    ChatModel(name: "Dev Stack", status: "A full stack developer"),
    ChatModel(name: "Balram", status: "Flutter Developer..........."),
    ChatModel(name: "Saket", status: "Web developer..."),
    ChatModel(name: "Bhanu Dev", status: "App developer...."),
    ChatModel(name: "Collins", status: "Raect developer.."),
    ChatModel(name: "Kishor", status: "Full Stack Web"),
    ChatModel(name: "Testing1", status: "Example work"),
    ChatModel(name: "Testing2", status: "Sharing is caring"),
    ChatModel(name: "Divyanshu", status: "....."),
    ChatModel(name: "Helper", status: "Love you Mom Dad"),
    ChatModel(name: "Tester", status: "I find the bugs"),
  ];
  List<ChatModel> groups = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "New Groups",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              Text(
                "Add participants",
                style: TextStyle(fontSize: 13),
              )
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
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
        body: Stack(
          children: [
            ListView.builder(
              itemCount: contact.length+1,
              itemBuilder: (context, index) {
                if (index == 0) {
                    return Container(
                      height: groups.length > 0 ? 90 : 10,
                    );
                  }
                return InkWell(
                  onTap: () {
                    setState(() {
                      if (contact[index-1].select) {
                        groups.remove(contact[index-1]);
                        contact[index-1].select = false;
                      } else {
                        groups.add(contact[index-1]);
                        contact[index-1].select = true;
                      }
                    });
                  },
                  child: ContactCard(chat: contact[index-1]),
                );
              },
            ),
            if (groups.isNotEmpty) 
              Column(
                children: [
                  Container(
                    height: 75,
                    color: Colors.white,
                    child: ListView.builder(
                      itemCount: groups.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              groups[index].select = false;
                              groups.removeAt(index);
                            });
                          },
                          child: Avatar(contact: groups[index]),
                        );
                      },
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  )
                ],
              )
          ],
        ));
  }
}
