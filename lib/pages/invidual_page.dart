import 'package:flutter/material.dart';
import 'package:websocket/model/chat_model.dart';

class InvidualPage extends StatefulWidget {
  const InvidualPage({super.key, required this.chatmodel});
  final ChatModel chatmodel;

  @override
  State<InvidualPage> createState() => _InvidualPageState();
}

class _InvidualPageState extends State<InvidualPage> {
  TextEditingController _controller=TextEditingController();
  

  @override
  void dispose() {
     // Xóa listener khi không sử dụng nữa
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        title: InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.chatmodel.name!,
                  style: TextStyle(fontSize: 18.5, fontWeight: FontWeight.bold),
                ),
                Text(
                  "last seen to day at 12:05 ",
                  style: TextStyle(fontSize: 13),
                )
              ],
            ),
          ),
        ),
        leading: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 24,
              ),
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blueGrey,
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text("View Contact"),
                  value: "View Contact ",
                ),
                PopupMenuItem(
                  child: Text("Media, licks, and docs"),
                  value: "Media, licks, and docs",
                ),
                PopupMenuItem(
                  child: Text("Whatsapp web"),
                  value: "Whatsapp web",
                ),
                PopupMenuItem(
                  child: Text("Search"),
                  value: "Search",
                ),
                PopupMenuItem(
                  child: Text("Mute Nofication"),
                  value: "Mute Nofication",
                ),
                PopupMenuItem(
                  child: Text("Wallpaper"),
                  value: "Wallpaper",
                ),
              ];
            },
          )
        ],
        backgroundColor: Colors.blue[200],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width - 55,
                      child: Card(
                        margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: TextFormField(
                          onChanged: (value){
                            setState(() {
                              
                            });
                          },
                          controller: _controller,
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          minLines: 1,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                              hintText: "Type message",
                              contentPadding: EdgeInsets.all(5),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: (){
                                      showModalBottomSheet(
                                        backgroundColor: Colors.transparent,
                                        context: context, 
                                        builder: (context) => bottomSheet(),);
                                    }, 
                                    icon: Icon(Icons.attach_file)),
                                    IconButton(
                                    onPressed: (){}, 
                                    icon: Icon(Icons.camera_alt))
                                ],
                              ),
                              ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blue,
                      child:IconButton(
                        onPressed: (){},
                        icon:  Icon(
                          _controller.text.isEmpty ?
                          Icons.mic:Icons.send),
                      ),
                      
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.blueGrey,
    );
  }
  Widget bottomSheet(){
  return Container(
    height: 278,
    width: MediaQuery.of(context).size.width,
    child: Card(
      margin: EdgeInsets.all(18),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Iconcreation(Icons.insert_drive_file, Colors.indigo,"Document"),
                 SizedBox(width: 40,),
                 Iconcreation(Icons.camera, Colors.pink,"Camera"),
                 SizedBox(width: 40,),
                 Iconcreation(Icons.insert_photo, Colors.purple,"Galary"),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Iconcreation(Icons.headset, Colors.orange,"Audio"),
                 SizedBox(width: 40,),
                 Iconcreation(Icons.location_pin, Colors.pink,"Location"),
                 SizedBox(width: 40,),
                 Iconcreation(Icons.person, Colors.blue,"Contact"),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
Widget Iconcreation(IconData icon, Color color, String text){
  return InkWell(
    onTap: (){},
    child: Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: Icon(icon,size: 29,color: Colors.white,),
        ),
        SizedBox(height: 5,),
        Text(text)
      ],
    ),
  );
}
}
