import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

@immutable
class Message extends StatelessWidget {
  final String id;
  final String userId;
  final String channelId;
  final String content;

  Message(
      {required this.id,
      required this.userId,
      required this.channelId,
      required this.content});

  Message copyWith({id, userId, channelId, content}) {
    return Message(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      channelId: channelId ?? this.channelId,
      content: content ?? this.content,
    );
  }

  static Message fromJson(Map<String, Object> json) {
    return Message(
        id: json["id"] as String,
        content: json["content"] as String,
        channelId: json["channelId"] as String,
        userId: json["userId"] as String);
  }

  static Message fromSnapshot(DocumentSnapshot snap) {
    return Message(
        id: snap.id,
        content: snap.data()!['content'],
        channelId: snap.data()!['channelId'],
        userId: snap.data()!['userId']);
  }

  Map<String, Object> toJson() {
    return {
      "id": this.id,
      "content": this.content,
      "channelId": this.channelId,
      "userId": this.userId,
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
              "--:--",
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
