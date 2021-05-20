import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_digital_shat/src/model/usessWidget {
  final User sender;
  final String time;
  final String text;
  final bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.unread,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            margin: EdgeInsets.only(left: 5.0, top: 5.0),
            child: CircleAvatar(child: Text(sender.name[0] + sender.name[1]))),
        Flexible(
          fit: FlexFit.loose,
          flex: 1,
          child: Container(
              margin: EdgeInsets.only(left: 5.0, top: 5.0), child: Text(text)),
        ),
      ],
    );
  }
}
