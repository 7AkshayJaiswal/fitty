import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "participants" field.
  List<DocumentReference>? _participants;
  List<DocumentReference> get participants => _participants ?? const [];
  bool hasParticipants() => _participants != null;

  // "groupName" field.
  String? _groupName;
  String get groupName => _groupName ?? '';
  bool hasGroupName() => _groupName != null;

  // "groupAdmin" field.
  DocumentReference? _groupAdmin;
  DocumentReference? get groupAdmin => _groupAdmin;
  bool hasGroupAdmin() => _groupAdmin != null;

  // "isPrivate" field.
  bool? _isPrivate;
  bool get isPrivate => _isPrivate ?? false;
  bool hasIsPrivate() => _isPrivate != null;

  // "chatType" field.
  String? _chatType;
  String get chatType => _chatType ?? '';
  bool hasChatType() => _chatType != null;

  // "lastMessage" field.
  DocumentReference? _lastMessage;
  DocumentReference? get lastMessage => _lastMessage;
  bool hasLastMessage() => _lastMessage != null;

  void _initializeFields() {
    _participants = getDataList(snapshotData['participants']);
    _groupName = snapshotData['groupName'] as String?;
    _groupAdmin = snapshotData['groupAdmin'] as DocumentReference?;
    _isPrivate = snapshotData['isPrivate'] as bool?;
    _chatType = snapshotData['chatType'] as String?;
    _lastMessage = snapshotData['lastMessage'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  String? groupName,
  DocumentReference? groupAdmin,
  bool? isPrivate,
  String? chatType,
  DocumentReference? lastMessage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'groupName': groupName,
      'groupAdmin': groupAdmin,
      'isPrivate': isPrivate,
      'chatType': chatType,
      'lastMessage': lastMessage,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.participants, e2?.participants) &&
        e1?.groupName == e2?.groupName &&
        e1?.groupAdmin == e2?.groupAdmin &&
        e1?.isPrivate == e2?.isPrivate &&
        e1?.chatType == e2?.chatType &&
        e1?.lastMessage == e2?.lastMessage;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.participants,
        e?.groupName,
        e?.groupAdmin,
        e?.isPrivate,
        e?.chatType,
        e?.lastMessage
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
