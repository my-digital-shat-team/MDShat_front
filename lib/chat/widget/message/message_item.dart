import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_digital_shat/model/message.dart';

extension DateHelpers on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return now.day == this.day &&
        now.month == this.month &&
        now.year == this.year;
  }
}

class MessageItem extends StatelessWidget {
  final Message message;
  final User user;

  MessageItem({required this.message, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5.0),
          child: Align(
            alignment: message.userId != user.id
                ? Alignment.topLeft
                : Alignment.topRight,
            child: Row(
              mainAxisAlignment: message.userId != user.id
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.end,
              children: [
                Text(
                  message.sendAt.isToday()
                      ? new DateFormat("HH:mm").format(message.sendAt)
                      : new DateFormat("EEEE d MMMM").format(message.sendAt),
                  style: TextStyle(fontSize: 12.0),
                ),
                Text(" - "),
                Text(
                  message.userId != user.id ? message.userName : "Vous",
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 5.0),
          decoration: BoxDecoration(
            color: message.userId != user.id
                ? Color(0xff0084ff)
                : Color(0xFFB6B6B6),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              topRight: Radius.circular(message.userId != user.id ? 20 : 0),
              topLeft: Radius.circular(message.userId != user.id ? 0 : 20),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin:
                          EdgeInsets.only(left: 12.0, top: 7.0, bottom: 7.0),
                      child: Text(
                        message.content,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
