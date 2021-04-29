import 'package:flutter/material.dart';
import 'package:my_digital_shat/model/message.dart';

class MessageItem extends StatelessWidget {
  final Message message;

  MessageItem({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(message.content),
    );
  }
}
