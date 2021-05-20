import 'dart:async';

import 'package:my_digital_shat/model/message.dart';

abstract class MessageRepository {
  Future<void> addNewMessage(Message message);

  Future<void> deleteMessage(Message message);

  Stream<List<Message>> messages();

  Future<void> updateMessage(Message message);
}
