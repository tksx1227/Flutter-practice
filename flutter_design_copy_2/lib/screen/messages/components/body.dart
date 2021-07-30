import 'package:flutter/material.dart';
import 'package:flutter_design_copy_2/constants.dart';
import 'package:flutter_design_copy_2/models/ChatMessage.dart';
import 'package:flutter_design_copy_2/screen/messages/components/message.dart';
import 'package:flutter_design_copy_2/screen/messages/components/chat_input_field.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ListView.builder(
              itemCount: demeChatMessages.length,
              itemBuilder: (context, index) => Message(
                message: demeChatMessages[index],
              ),
            ),
          ),
        ),
        ChatInputField(),
      ],
    );
  }
}
