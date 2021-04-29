import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_digital_shat/model/message.dart';

import 'message_repository.dart';

class FirebaseMessageRepository implements MessageRepository {
  final messageCollection = FirebaseFirestore.instance.collection('messages');

  @override
  Future<void> addNewMessage(Message message) {
    final x = message.toJson();
    return messageCollection.add(x);
  }

  @override
  Future<void> deleteMessage(Message message) async {
    return messageCollection.doc(message.id).delete();
  }

  @override
  Stream<List<Message>> messages() {
    return messageCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((document) => Message.fromSnapshot(document))
          .toList();
    });
  }

  @override
  Future<void> updateMessage(Message updatedMessage) {
    return messageCollection
        .doc(updatedMessage.id)
        .update(updatedMessage.toJson());
  }
}