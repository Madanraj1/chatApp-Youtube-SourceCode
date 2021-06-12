import 'package:chatapp/constant.dart';
import 'package:chatapp/helper/Profile.dart';
import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  Profile person;
  final press;
  final chat;
  ChatCard({Key? key, this.chat, this.press, required this.person})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.75),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(person.profilePic),
                ),
                Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          width: 3,
                        ),
                      ),
                    ))
              ],
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    person.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 8),
                  Opacity(
                    opacity: 0.64,
                    child: Text(
                      "---------",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            )),
            Opacity(
              opacity: 0.64,
              child: Text("5mins ago"),
            ),
          ],
        ),
      ),
    );
  }
}
