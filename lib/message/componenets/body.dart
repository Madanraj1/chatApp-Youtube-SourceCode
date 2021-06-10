import 'package:chatapp/helper/ChatMessage.dart';
import 'package:chatapp/message/componenets/Message.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController msgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Message(
                  profile:
                      "https://images.pexels.com/photos/6474492/pexels-photo-6474492.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                  message: ChatMessage(
                      messageType: "text",
                      messageStatus: "",
                      isSender: false,
                      text: "hey there how are you"));
            },
          ),
        ),
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
