import 'package:equatable/equatable.dart';
import 'package:my_digital_shat/model/message.dart';

abstract class MessageEvent extends Equatable {
  const MessageEvent();

  @override
  List<Object> get props => [];
}

class MessageEventQueryAll extends MessageEvent {}

class MessageEventInsert extends MessageEvent {
  final Message message;

  const MessageEventInsert(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'AddMessage { message: $message }';
}

class MessageEventUpdate extends MessageEvent {
  final Message message;

  const MessageEventUpdate(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'UpdateMessage { updatedMessage: $message }';
}

class MessageEventDelete extends MessageEvent {
  final Message message;

  const MessageEventDelete(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'DeleteMessage { message: $message }';
}

class MessageEventUpdated extends MessageEvent {
  final List<Message> messages;

  const MessageEventUpdated(this.messages);

  @override
  List<Object> get props => [messages];
}
