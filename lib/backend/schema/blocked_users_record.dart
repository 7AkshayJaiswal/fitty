import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BlockedUsersRecord extends FirestoreRecord {
  BlockedUsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "blockedBy" field.
  DocumentReference? _blockedBy;
  DocumentReference? get blockedBy => _blockedBy;
  bool hasBlockedBy() => _blockedBy != null;

  // "blockedUser" field.
  DocumentReference? _blockedUser;
  DocumentReference? get blockedUser => _blockedUser;
  bool hasBlockedUser() => _blockedUser != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  bool hasReason() => _reason != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _blockedBy = snapshotData['blockedBy'] as DocumentReference?;
    _blockedUser = snapshotData['blockedUser'] as DocumentReference?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _reason = snapshotData['reason'] as String?;
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('blockedUsers');

  static Stream<BlockedUsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BlockedUsersRecord.fromSnapshot(s));

  static Future<BlockedUsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BlockedUsersRecord.fromSnapshot(s));

  static BlockedUsersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BlockedUsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BlockedUsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BlockedUsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BlockedUsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BlockedUsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBlockedUsersRecordData({
  DocumentReference? blockedBy,
  DocumentReference? blockedUser,
  DateTime? createdAt,
  String? reason,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'blockedBy': blockedBy,
      'blockedUser': blockedUser,
      'createdAt': createdAt,
      'reason': reason,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class BlockedUsersRecordDocumentEquality
    implements Equality<BlockedUsersRecord> {
  const BlockedUsersRecordDocumentEquality();

  @override
  bool equals(BlockedUsersRecord? e1, BlockedUsersRecord? e2) {
    return e1?.blockedBy == e2?.blockedBy &&
        e1?.blockedUser == e2?.blockedUser &&
        e1?.createdAt == e2?.createdAt &&
        e1?.reason == e2?.reason &&
        e1?.status == e2?.status;
  }

  @override
  int hash(BlockedUsersRecord? e) => const ListEquality()
      .hash([e?.blockedBy, e?.blockedUser, e?.createdAt, e?.reason, e?.status]);

  @override
  bool isValidKey(Object? o) => o is BlockedUsersRecord;
}
