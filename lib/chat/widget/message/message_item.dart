import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
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

extension UserHelper on Message {
  bool isMine(user) {
    return this.userId == user.id;
  }
}

class MessageItem extends StatelessWidget {
  final Message message;
  final User user;

  MessageItem({required this.message, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.only(bottom: 5.0, top: 5.0),
        child: Row(
          mainAxisAlignment: message.isMine(user)
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            Text(
              message.sendAt.isToday()
                  ? new DateFormat.jm('fr_FR').format(message.sendAt)
                  : new DateFormat.yMMMd('fr_FR').format(message.sendAt),
              style: TextStyle(
                fontSize: 12.0,
                color: Color(0xff8d8d8d),
              ),
            ),
            Text(
              " - ",
              style: TextStyle(
                fontSize: 12.0,
                color: Color(0xff8d8d8d),
              ),
            ),
            Text(
              message.isMine(user) ? "Vous" : message.userName,
              style: TextStyle(
                fontSize: 12.0,
                color: Color(0xff8d8d8d),
              ),
            ),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: message.isMine(user)
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: message.isMine(user)
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5.0),
                decoration: BoxDecoration(
                  color: message.isMine(user)
                      ? Color(0xFFB6B6B6)
                      : Color(0xff0084ff),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(6),
                    bottomRight: Radius.circular(6),
                    topRight: Radius.circular(message.isMine(user) ? 0 : 6),
                    topLeft: Radius.circular(message.isMine(user) ? 6 : 0),
                  ),
                ),
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.8),
                  margin: EdgeInsets.only(
                      left: 12.0, right: 12.0, top: 7.0, bottom: 7.0),
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
      )
    ]);
  }
}
