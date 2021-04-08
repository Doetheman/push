/// -----------------------------------------------------------------
///
/// File: conversation_repository.dart
/// Project: PUSH
/// File Created: Thursday, March 18th, 2021
/// Description:
///
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Wednesday, April 7th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:push_app/app/data/models/conversation.dart';
import 'package:push_app/app/data/models/direct_message.dart';
import 'package:push_app/app/data/models/enums.dart';
import 'package:push_app/app/data/providers/auth_provider.dart';
import 'package:push_app/app/data/providers/firestore_provider.dart';
import 'package:push_app/app/utils/is.dart';

class ConversationRepository {
  final FirestoreProvider firestoreProvider = Get.find();
  final AuthProvider authProvider = Get.find();

  CollectionReference get conversationCollectionReference => firestoreProvider
      .getCollectionReference(FirestoreCollection.CONVERSATIONS.toString());

  CollectionReference getMessagesCollectionReference(String convesationId) =>
      conversationCollectionReference
          .doc(convesationId)
          .collection(FirestoreCollection.MESSAGES.value);

  Future<List<Conversation>> getAllConversations(
          {Conversation lastConversation}) =>
      firestoreProvider
          .queryCollection(
            collection: conversationCollectionReference,
            key: 'userIds',
            value: authProvider.currentUid,
            orderBy: 'lastUpdatedAt',
            queryOperator: FirestoreQueryOperator.ARRAY_CONTAINS,
            descending: true,
            limit: 20,
            startAfterDocument: Is.truthy(lastConversation)
                ? lastConversation.documentSnapshot
                : null,
          )
          .then(
            (QuerySnapshot querySnapshot) =>
                querySnapshot.docs.map((DocumentSnapshot documentSnapshot) {
              Conversation conversation =
                  Conversation.fromJson(documentSnapshot.data());
              conversation.documentSnapshot = documentSnapshot;
              return conversation;
            }).toList(),
          );

  Future<Conversation> getConversation(String uid) => firestoreProvider
          .queryCollection(
        startingQuery: firestoreProvider.buildQuery(
          collection: conversationCollectionReference,
          key: authProvider.currentUid,
          value: true,
          queryOperator: FirestoreQueryOperator.IS_EQUAL_TO,
        ),
        key: uid,
        value: true,
        queryOperator: FirestoreQueryOperator.IS_EQUAL_TO,
      )
          .then((QuerySnapshot querySnapshot) {
        if (querySnapshot.size == 0) {
          return null;
        }

        Conversation conversation =
            Conversation.fromJson(querySnapshot.docs[0].data());
        conversation.documentSnapshot = querySnapshot.docs[0];
        return conversation;
      });

  Future<Conversation> add(Conversation conversation) async {
    conversation.documentReference = await firestoreProvider.createDocument(
      conversationCollectionReference,
      conversation.toJson(),
    );

    return conversation;
  }

  Future<List<DirectMessage>> getAllMessages(Conversation conversation,
          {DirectMessage lastMessage}) async =>
      firestoreProvider
          .queryCollection(
            collection: getMessagesCollectionReference(conversation.id),
            orderBy: 'createdAt',
            limit: 40,
            descending: true,
            startAfterDocument: lastMessage?.documentSnapshot,
          )
          .then(
            (QuerySnapshot querySnapshot) =>
                querySnapshot.docs.map((DocumentSnapshot doc) {
              DirectMessage message = DirectMessage.fromJson(doc.data());
              message.documentSnapshot = doc;
              return message;
            }).toList(),
          );

  Future<void> update(Conversation conversation) {
    conversation.lastUpdatedAt = DateTime.now();
    return firestoreProvider.updateDocument(
      conversation.documentReference ??
          conversationCollectionReference.doc(conversation.id),
      conversation.toJson(),
    );
  }

  Future<void> createMessage(
          Conversation conversation, DirectMessage message) async =>
      firestoreProvider.createDocument(
        getMessagesCollectionReference(conversation.id),
        message.toJson(),
      );

  StreamSubscription<QuerySnapshot> conversationsStream(
          Function onConversationUpdate) =>
      firestoreProvider
          .queryCollectionSnapshots(
        collection: conversationCollectionReference,
        key: 'userIds',
        value: authProvider.currentUid,
        orderBy: 'lastUpdatedAt',
        queryOperator: FirestoreQueryOperator.ARRAY_CONTAINS,
        descending: true,
        limit: 1,
      )
          .listen(
        (QuerySnapshot querySnapshot) {
          Conversation conversation = Is.falsy(querySnapshot.docs) ||
                  Is.falsy(querySnapshot.docs[0].data()['id'])
              ? null
              : Conversation.fromJson(
                  querySnapshot.docs[0].data(),
                );
          if (Is.truthy(conversation)) {
            conversation.documentSnapshot = querySnapshot.docs[0];
          }
          onConversationUpdate(conversation);
        },
      );

  StreamSubscription<QuerySnapshot> latestMessageStream(
    Conversation conversation,
    Function onNewMessage,
  ) =>
      firestoreProvider
          .queryCollectionSnapshots(
        collection: getMessagesCollectionReference(conversation.id),
        orderBy: 'createdAt',
        limit: 1,
        descending: true,
      )
          .listen((QuerySnapshot querySnapshot) {
        onNewMessage(Is.falsy(querySnapshot.docs)
            ? null
            : DirectMessage.fromJson(
                querySnapshot.docs[0].data(),
              ));
      });
}
