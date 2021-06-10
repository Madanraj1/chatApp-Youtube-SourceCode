import 'package:chatapp/helper/ChatMessage.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class Message extends StatefulWidget {
  final String profile;
  final ChatMessage message;
  Message({
    Key? key,
    this.profile = "",
    required this.message,
  }) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        mainAxisAlignment: widget.message.isSender
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!widget.message.isSender) ...[
            CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage(widget.profile),
            ),
            SizedBox(
              width: kDefaultPadding / 2,
            ),
          ],
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 0.75,
              vertical: kDefaultPadding / 2,
            ),
            decoration: BoxDecoration(
              color:
                  kPrimaryColor.withOpacity(widget.message.isSender ? 1 : 0.1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              widget.message.text,
              style: TextStyle(
                color: widget.message.isSender
                    ? Colors.white
                    : Theme.of(context).textTheme.bodyText1!.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
