import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_digital_shat/chat/bloc/blocs.dart';
import 'package:my_digital_shat/chat/widget/message/messages.dart';

class ChatPage extends StatelessWidget {
  static Page page() => MaterialPage<void>(child: Chat());

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => Chat());
  }

  const ChatPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chat();
  }
}

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> with AfterLayoutMixin<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Messages(),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    BlocProvider.of<MessageBloc>(context).add(MessageEventQueryAll());
  }
}
