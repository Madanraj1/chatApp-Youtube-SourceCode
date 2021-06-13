import 'package:chatapp/helper/ChatMessage.dart';
import 'package:chatapp/message/componenets/Message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant.dart';

class Body extends StatefulWidget {
  final uid, peerprofile;
  const Body({Key? key, required this.uid, required this.peerprofile})
      : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController msgController = TextEditingController();

  var groupChatId = "";

  readLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uid = prefs.getString("uid");
    var peerUid = widget.uid;

    if (uid.hashCode <= peerUid.hashCode) {
      groupChatId = "$uid-$peerUid";
    } else {
      groupChatId = "$peerUid-$uid";
    }

    setState(() {});
  }

  void sentMsg(String content) async {
    msgController.clear();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uid = prefs.getString("uid");
    var peerUid = widget.uid;
    var documentReference = FirebaseFirestore.instance
        .collection("Messages")
        .doc(groupChatId)
        .collection(groupChatId)
        .doc(DateTime.now().millisecondsSinceEpoch.toString());

    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(documentReference, {
        "idFrom": uid,
        "idTo": peerUid,
        "timestamp": DateTime.now().millisecondsSinceEpoch.toString(),
        "content": content,
        "type": "---",
      });
    });
  }

  @override
  void initState() {
    super.initState();
    readLocal();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Messages")
              .doc(groupChatId)
              .collection(groupChatId)
              .orderBy("timestamp", descending: false)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  var msg = snapshot.data?.docs[index];
                  var peeruid = widget.uid;
                  return Message(
                      profile: widget.peerprofile,
                      message: ChatMessage(
                        messageType: "text",
                        messageStatus: "",
                        isSender: msg?.get("idFrom") != peeruid ? true : false,
                        text: "${msg?.get("content")}",
                      ));
                },
              );
            } else {
              return Center(
                child: Text("Loading...."),
              );
            }
          },
        )),
        // this is the text field part

        Container(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding / 2,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 32,
                color: Color(0xFF087949).withOpacity(0.08),
              ),
            ],
          ),
          child: SafeArea(
            child: Row(
              children: [
                Icon(
                  Icons.sentiment_satisfied_alt_outlined,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .color!
                      .withOpacity(0.64),
                ),
                SizedBox(
                  width: kDefaultPadding / 4,
                ),
                Expanded(
                  child: TextField(
                    controller: msgController,
                    onSubmitted: (value) {
                      sentMsg(value);
                    },
                    decoration: InputDecoration(
                      hintText: "Type message",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Icon(
                  Icons.attach_file,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .color!
                      .withOpacity(0.64),
                ),
                SizedBox(width: kDefaultPadding / 4),
                Icon(
                  Icons.camera_alt_outlined,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .color!
                      .withOpacity(0.64),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
