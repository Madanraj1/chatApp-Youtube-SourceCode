import 'package:chatapp/message/componenets/body.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class MessageScreen extends StatefulWidget {
  String name, uid, profile;
  MessageScreen({Key? key, this.name = "", this.profile = "", this.uid = ""})
      : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            BackButton(),
            CircleAvatar(
              backgroundImage: NetworkImage(widget.profile),
            ),
            SizedBox(width: kDefaultPadding * 0.75),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.name}",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Active 3m ago",
                  style: TextStyle(fontSize: 12),
                )
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.local_phone),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {},
          ),
          SizedBox(width: kDefaultPadding / 2),
        ],
      ),
      body: Body(
        uid: widget.uid,
        peerprofile: widget.profile,
      ),
    );
  }
}
