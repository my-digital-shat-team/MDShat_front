import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:my_digital_shat/repository/message/message_repository.dart';

import 'message_event.dart';
import 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final MessageRepository _messageRepository;
  late StreamSubscription _messageSubscription;

  MessageBloc({required MessageRepository messageRepository})
      : _messageRepository = messageRepository,
        super(MessageStateLoading());

  @override
  Stream<MessageState> mapEventToState(MessageEvent messageEvent) async* {
    if (messageEvent is MessageEventQueryAll) {
      _messageSubscription.cancel();
      _messageSubscription = _messageRepository.messages().listen(
            (message) => add(MessageEventUpdated(message)),
          );
    } else if (messageEvent is MessageEventInsert) {
      _messageRepository.addNewMessage(messageEvent.message);
    } else if (messageEvent is MessageEventUpdate) {
      _messageRepository.updateMessage(messageEvent.message);
    } else if (messageEvent is MessageEventDelete) {
      _messageRepository.deleteMessage(messageEvent.message);
    } else if (messageEvent is MessageEventUpdated) {
      yield MessageStateLoaded(messageEvent.messages);
    }
  }

  @override
  Future<void> close() {
    _messageSubscription.cancel();
    return super.close();
  }
}
