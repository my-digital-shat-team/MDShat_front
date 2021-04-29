import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_digital_shat/src/model/user.dart';
import 'package:faker/faker.dart';

class Message extends StatelessWidget {
  final User sender;
  final String time;
  final String text;
  final bool unread;
  bool isCurrentUser;

  Message({
    this.sender,
    this.time,
    this.text,
    this.unread,
  });

  @override
  Widget build(BuildContext context) {
    this.isCurrentUser = sender.name == 'Current User';
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
      color: isCurrentUser ? Color(0xff0084ff) : Color(0xffe4e6eb),
      borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Row(
        textDirection: isCurrentUser ? TextDirection.rtl : TextDirection.ltr,
        children: [
          Container(margin: EdgeInsets.all(8.0), child: CircleAvatar(child: Text(sender.name[0] + sender.name[1]) ),
          ),
          Flexible(
            child: Container(margin: EdgeInsets.all(8.0) , child: Text(text, style: TextStyle(color: isCurrentUser ? Colors.white : Colors.black))),
          ),
        ],),
    );
  }
}

var faker = new Faker();

final User currentUser = User(
  id: 0,
  name: 'Current User',
);

final User greg = User(
  id: 1,
  name: 'Greg',
);
final User james = User(
  id: 2,
  name: 'James',
);
final User john = User(
  id: 3,
  name: 'John',
);
final User olivia = User(
  id: 4,
  name: 'Olivia',
);
final User sam = User(
  id: 5,
  name: 'Sam',
);
final User sophia = User(
  id: 6,
  name: 'Sophia',
);
final User steven = User(
  id: 7,
  name: 'Steven',
);

List<Message> chats = [
  Message(
    sender: james,
    time: faker.date.time().substring(0, 5),
    text: faker.lorem.sentence(),
    unread: true,
  ),
  Message(
    sender: olivia,
    time: faker.date.time().substring(0, 5),
    text: faker.lorem.sentence(),
    unread: true,
  ),
  Message(
    sender: john,
    time: faker.date.time().substring(0, 5),
    text: faker.lorem.sentence(),
    unread: false,
  ),
  Message(
    sender: sophia,
    time: faker.date.time().substring(0, 5),
    text: faker.lorem.sentence(),
    unread: true,
  ),
  Message(
    sender: steven,
    time: faker.date.time().substring(0, 5),
    text: faker.lorem.sentence(),
    unread: false,
  ),
  Message(
    sender: sam,
    time: faker.date.time().substring(0, 5),
    text: faker.lorem.sentence(),
    unread: false,
  ),
  Message(
    sender: greg,
    time: faker.date.time().substring(0, 5),
    text: faker.lorem.sentence(),
    unread: false,
  ),
];

List<Message> messages = [
  Message(
    sender: james,
    time: faker.date.time().substring(0, 5),
    text: faker.lorem.sentence(),
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: faker.date.time().substring(0, 5),
    text: faker.lorem.sentence(),
    unread: true,
  ),
  Message(
    sender: james,
    time: faker.date.time().substring(0, 5),
    text: faker.lorem.sentence(),
    unread: true,
  ),
  Message(
    sender: james,
    time: faker.date.time().substring(0, 5),
    text: faker.lorem.sentence(),
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: faker.date.time().substring(0, 5),
    text: faker.lorem.sentence(),
    unread: true,
  ),
  Message(
    sender: james,
    time: faker.date.time().substring(0, 5),
    text: faker.lorem.sentence(),
    unread: true,
  ),
];