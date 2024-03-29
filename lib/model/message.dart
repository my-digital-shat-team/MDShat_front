import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

@immutable
class Message extends StatelessWidget {
  final String uid;
  final String userId;
  final String userName;
  final String content;
  final DateTime sendAt;

  Message(
      {required this.userId,
      required this.userName,
      required this.content,
      required this.sendAt,
      this.uid = ""});

  Message copyWith({userId, sendAt, content, uid, userName}) {
    return Message(
      uid: uid ?? this.uid,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      content: content ?? this.content,
      sendAt: sendAt ?? this.sendAt,
    );
  }

  static Message fromJson(Map<String, Object> json) {
    return Message(
      uid: json["uid"] as String,
      content: json["content"] as String,
      userId: json["userId"] as String,
      userName: json["userName"] as String,
      sendAt: json["sendAt"] as DateTime,
    );
  }

  static Message fromSnapshot(DocumentSnapshot snap) {
    return Message(
        uid: snap.id,
        content: snap.data()!['content'],
        userId: snap.data()!['userId'],
        userName: snap.data()!['userName'],
        sendAt: DateTime.parse(snap.data()!['sendAt'].toDate().toString()));
  }

  Map<String, Object> toJson() {
    return {
      "content": this.content,
      "userId": this.userId,
      "sendAt": this.sendAt,
      "userName": this.userName,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: Colors.orange,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              this.sendAt.hour.toString() + '-' + this.sendAt.minute.toString(),
              style: TextStyle(color: Colors.black54),
            ),
          ),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 5.0),
              child: Container(),
            ),
            Flexible(
              fit: FlexFit.loose,
              flex: 1,
              child: Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      this.content,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  )),
            ),
          ],
        ),
        Container(
          height: 20.0,
        ),
      ],
    );
  }
}
