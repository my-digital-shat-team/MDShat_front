import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_digital_shat/model/message.dart';

import 'message_repository.dart';

class FirebaseMessageRepository implements MessageRepository {
  final messageCollection = FirebaseFirestore.instance.collection('messages');

  @override
  Future<void> addNewMessage(Message message) {
    return messageCollection.add(message.toJson());
  }

  @override
  Future<void> deleteMessage(Message message) async {
    return messageCollection.doc(message.uid).delete();
  }

  @override
  Stream<List<Message>> messages() {
    return messageCollection.orderBy('sendAt').snapshots().map((snapshot) {
      return snapshot.docs
          .map((document) => Message.fromSnapshot(document))
          .toList();
    });
  }

  @override
  Future<void> updateMessage(Message updatedMessage) {
    return messageCollection
        .doc(updatedMessage.uid)
        .update(updatedMessage.toJson());
  }
}
