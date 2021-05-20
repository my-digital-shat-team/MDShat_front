import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_digital_shat/app/bloc/app_bloc.dart';
import 'package:my_digital_shat/chat/bloc/blocs.dart';
import 'package:my_digital_shat/chat/widget/message/messages.dart';
import 'package:my_digital_shat/home/view/home_page.dart';
import 'package:my_digital_shat/model/message.dart';

extension CapExtension on String {
  String get inCaps =>
      this.length > 0 ? '${this[0].toUpperCase()}${this.substring(1)}' : '';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach => this
      .replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((str) => str.inCaps)
      .join(" ");
}

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
  final _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                _backButton(),
              ],
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Messages(),
              ),
            ),
            Divider(height: 1.0),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: _buildTextComposer(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    BlocProvider.of<MessageBloc>(context).add(MessageEventQueryAll());
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push<void>(HomePage.route());
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Retour',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _buildTextComposer() {
    final user = context.select((AppBloc bloc) => bloc.state.user);

    void _handleSubmitted(String text) {
      _textController.clear();
      setState(() {
        String userName = "";
        if (user.email != null) {
          userName = user.email!
              .split("@")[0]
              .split(".")
              .join(" ")
              .capitalizeFirstofEach;
        }
        Message message = new Message(
            userId: user.id,
            userName: userName,
            content: text,
            sendAt: DateTime.now());
        print(message);
        BlocProvider.of<MessageBloc>(context).add(MessageEventInsert(message));
        print('insert ' + text);
      });
      _focusNode.requestFocus();
    }

    return IconTheme(
      data: IconThemeData(color: Color(0xff0084ff)),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: (value) {
                  _handleSubmitted(value);
                  _focusNode.unfocus();
                },
                decoration:
                    InputDecoration.collapsed(hintText: 'Envoyer un message'),
                focusNode: _focusNode,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                  icon: Icon(Icons.send, color: Color(0xfff2aabb7)),
                  onPressed: () {
                    _handleSubmitted(_textController.text);
                    _focusNode.unfocus();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
