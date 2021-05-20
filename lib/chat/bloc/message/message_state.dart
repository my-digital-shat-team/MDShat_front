import 'package:equatable/equatable.dart';
import 'package:my_digital_shat/model/message.dart';

abstract class MessageState extends Equatable {
  const MessageState();

  @override
  List<Object> get props => [];
}

class MessageStateLoading extends MessageState {}

class MessageStateLoaded extends MessageState {
  final List<Message> messages;

  const MessageStateLoaded([this.messages = const []]);

  @override
  List<Object> get props => [messages];

  @override
  String toString() => 'MessageStateLoaded, messages: $messages';
}

class MessageStateFailed extends MessageState {
  final error;
  MessageStateFailed({this.error});
}
