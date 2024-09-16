import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FriendRequestsRecord extends FirestoreRecord {
  FriendRequestsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "fromUserID" field.
  DocumentReference? _fromUserID;
  DocumentReference? get fromUserID => _fromUserID;
  bool hasFromUserID() => _fromUserID != null;

  // "toUserID" field.
  DocumentReference? _toUserID;
  DocumentReference? get toUserID => _toUserID;
  bool hasToUserID() => _toUserID != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "requestSentAt" field.
  DateTime? _requestSentAt;
  DateTime? get requestSentAt => _requestSentAt;
  bool hasRequestSentAt() => _requestSentAt != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  void _initializeFields() {
    _fromUserID = snapshotData['fromUserID'] as DocumentReference?;
    _toUserID = snapshotData['toUserID'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _requestSentAt = snapshotData['requestSentAt'] as DateTime?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
    _users = getDataList(snapshotData['users']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('friendRequests');

  static Stream<FriendRequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FriendRequestsRecord.fromSnapshot(s));

  static Future<FriendRequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FriendRequestsRecord.fromSnapshot(s));

  static FriendRequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FriendRequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FriendRequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FriendRequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FriendRequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FriendRequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFriendRequestsRecordData({
  DocumentReference? fromUserID,
  DocumentReference? toUserID,
  String? status,
  DateTime? requestSentAt,
  DateTime? updatedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fromUserID': fromUserID,
      'toUserID': toUserID,
      'status': status,
      'requestSentAt': requestSentAt,
      'updatedAt': updatedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class FriendRequestsRecordDocumentEquality
    implements Equality<FriendRequestsRecord> {
  const FriendRequestsRecordDocumentEquality();

  @override
  bool equals(FriendRequestsRecord? e1, FriendRequestsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.fromUserID == e2?.fromUserID &&
        e1?.toUserID == e2?.toUserID &&
        e1?.status == e2?.status &&
        e1?.requestSentAt == e2?.requestSentAt &&
        e1?.updatedAt == e2?.updatedAt &&
        listEquality.equals(e1?.users, e2?.users);
  }

  @override
  int hash(FriendRequestsRecord? e) => const ListEquality().hash([
        e?.fromUserID,
        e?.toUserID,
        e?.status,
        e?.requestSentAt,
        e?.updatedAt,
        e?.users
      ]);

  @override
  bool isValidKey(Object? o) => o is FriendRequestsRecord;
}
