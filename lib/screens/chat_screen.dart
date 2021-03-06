import 'package:chat_ui/models/message_model.dart';
import 'package:chat_ui/models/user_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final User user;
  const ChatScreen({ Key? key, required this.user }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message,bool isMe){
    return Row(
      children: [
        Container(
          margin: isMe ? EdgeInsets.only(top:8.0,bottom: 8.0,left: 80.0):
          EdgeInsets.only(top:8.0,bottom: 8.0),
          padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 15.0),
          width: MediaQuery.of(context).size.width*0.75,
          decoration: BoxDecoration(
          color: isMe ? Color(0xFFFEF9EB):Color(0xFFFFEFEE),
            borderRadius: isMe ? BorderRadius.only(
              topLeft: Radius.circular(15.0),
              bottomLeft: Radius.circular(15.0),
            ):BorderRadius.only(
              topRight: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
            ),
          ),
            child :Column(
        crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(message.time,style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600
                ),
                ),
                SizedBox(height: 8.0,),
                Text(message.text,style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600
                ),),
              ],
            ),
        ),
        isMe ? SizedBox.shrink():IconButton(
                  icon: message.isLiked? Icon(Icons.favorite): Icon(Icons.favorite_border),
                  iconSize: 30.0,
                  color: message.isLiked ?Colors.red:Colors.blueGrey,
                  onPressed: (){},
       ), 
      ],
    );
  }
  _buildMessageComposer(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.photo),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            ),
            Expanded(
              child : TextField(
                textCapitalization: TextCapitalization.sentences,
                onChanged: (value){

                },
                decoration: InputDecoration.collapsed(
                  hintText: "send a message",
                ),
              )
            ),
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(widget.user.name,style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              
              ),),
      actions: <Widget>[IconButton(
                  icon: const Icon(Icons.more_horiz),
                  iconSize: 30.0,
                  color: Colors.white,
                  onPressed: (){},
       ),
      ],
      ),
      body: GestureDetector(
        onTap: ()=>FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration( 
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                    reverse: true,
                        itemCount: messages.length,
                        itemBuilder: (BuildContext context,int index){
                          final Message message=messages[index];
                          bool isMe=message.sender.id == currentUser.id; 
                          return _buildMessage(message,isMe);
                        }
                        ),
                )
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      )
      );
  }
}