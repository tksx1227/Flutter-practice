import 'package:flutter/material.dart';
import 'package:flutter_design_copy_2/constants.dart';
import 'package:flutter_design_copy_2/models/Chat.dart';
import 'package:flutter_design_copy_2/components/filled_outline_button.dart';
import 'package:flutter_design_copy_2/screen/chats/components/chat_card.dart';
import 'package:flutter_design_copy_2/screen/messages/message_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(
              kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
          color: kPrimaryColor,
          child: Row(
            children: [
              FillOutlineButton(press: () {}, text: "Recent Message"),
              SizedBox(width: kDefaultPadding),
              FillOutlineButton(press: () {}, text: "Active", isFilled: false),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
              chat: chatsData[index],
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MessagesScreen(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
