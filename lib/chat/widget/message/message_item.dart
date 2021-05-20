import 'package:flutter/material.dart';
import 'package:my_digital_shat/model/message.dart';

class MessageItem extends StatelessWidget {
  final Message message;

  MessageItem({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
          color: Color(0xff0084ff),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: 12.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                message.sendAt.toString(),
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 6.0),
                  child: CircleAvatar(child: Text('J' + 'D'))),
              Flexible(
                fit: FlexFit.loose,
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 12.0),
                  child: Text(
                    message.content,
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
