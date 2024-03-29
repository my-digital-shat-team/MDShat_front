import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_digital_shat/app/bloc/app_bloc.dart';
import 'package:my_digital_shat/chat/bloc/message/message_bloc.dart';
import 'package:my_digital_shat/chat/bloc/message/message_state.dart';
import 'package:my_digital_shat/chat/widget/message/message_item.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> with AfterLayoutMixin<Messages> {
  ScrollController _scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);

    return BlocBuilder<MessageBloc, MessageState>(
      builder: (context, state) {
        if (state is MessageStateLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MessageStateLoaded) {
          if (_scrollController.hasClients) scrollToBottom();
          final messages = state.messages;
          return ListView.builder(
            controller: _scrollController,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              return MessageItem(message: message, user: user);
            },
          );
        } else {
          return Container();
        }
      },
    );
  }

  void scrollToBottom() {
    Timer(Duration(milliseconds: 100), () {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  void afterFirstLayout(BuildContext context) {
    scrollToBottom();
  }
}
