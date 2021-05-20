import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_digital_shat/app/bloc/app_bloc.dart';
import 'package:my_digital_shat/chat/bloc/message/message_bloc.dart';
import 'package:my_digital_shat/chat/bloc/message/message_state.dart';
import 'package:my_digital_shat/chat/widget/message/message_item.dart';

class Messages extends StatelessWidget {
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
          final messages = state.messages;
          return ListView.builder(
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
}
