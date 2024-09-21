import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessagesRecord extends FirestoreRecord {
  MessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "senderID" field.
  DocumentReference? _senderID;
  DocumentReference? get senderID => _senderID;
  bool hasSenderID() => _senderID != null;

  // "messageText" field.
  String? _messageText;
  String get messageText => _messageText ?? '';
  bool hasMessageText() => _messageText != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "readedBy" field.
  List<DocumentReference>? _readedBy;
  List<DocumentReference> get readedBy => _readedBy ?? const [];
  bool hasReadedBy() => _readedBy != null;

  // "messageType" field.
  MessageType? _messageType;
  MessageType? get messageType => _messageType;
  bool hasMessageType() => _messageType != null;

  // "messageImage" field.
  String? _messageImage;
  String get messageImage => _messageImage ?? '';
  bool hasMessageImage() => _messageImage != null;

  void _initializeFields() {
    _senderID = snapshotData['senderID'] as DocumentReference?;
    _messageText = snapshotData['messageText'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _readedBy = getDataList(snapshotData['readedBy']);
    _messageType = deserializeEnum<MessageType>(snapshotData['messageType']);
    _messageImage = snapshotData['messageImage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('messages');

  static Stream<MessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessagesRecord.fromSnapshot(s));

  static Future<MessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessagesRecord.fromSnapshot(s));

  static MessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessagesRecordData({
  DocumentReference? senderID,
  String? messageText,
  DateTime? timestamp,
  MessageType? messageType,
  String? messageImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'senderID': senderID,
      'messageText': messageText,
      'timestamp': timestamp,
      'messageType': messageType,
      'messageImage': messageImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessagesRecordDocumentEquality implements Equality<MessagesRecord> {
  const MessagesRecordDocumentEquality();

  @override
  bool equals(MessagesRecord? e1, MessagesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.senderID == e2?.senderID &&
        e1?.messageText == e2?.messageText &&
        e1?.timestamp == e2?.timestamp &&
        listEquality.equals(e1?.readedBy, e2?.readedBy) &&
        e1?.messageType == e2?.messageType &&
        e1?.messageImage == e2?.messageImage;
  }

  @override
  int hash(MessagesRecord? e) => const ListEquality().hash([
        e?.senderID,
        e?.messageText,
        e?.timestamp,
        e?.readedBy,
        e?.messageType,
        e?.messageImage
      ]);

  @override
  bool isValidKey(Object? o) => o is MessagesRecord;
}
