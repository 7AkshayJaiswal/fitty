import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserBasedStepCountRecord extends FirestoreRecord {
  UserBasedStepCountRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "steps" field.
  int? _steps;
  int get steps => _steps ?? 0;
  bool hasSteps() => _steps != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "joinedAt" field.
  DateTime? _joinedAt;
  DateTime? get joinedAt => _joinedAt;
  bool hasJoinedAt() => _joinedAt != null;

  // "leftAt" field.
  DateTime? _leftAt;
  DateTime? get leftAt => _leftAt;
  bool hasLeftAt() => _leftAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _steps = castToType<int>(snapshotData['steps']);
    _user = snapshotData['user'] as DocumentReference?;
    _joinedAt = snapshotData['joinedAt'] as DateTime?;
    _leftAt = snapshotData['leftAt'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('userBasedStepCount')
          : FirebaseFirestore.instance.collectionGroup('userBasedStepCount');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('userBasedStepCount').doc(id);

  static Stream<UserBasedStepCountRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserBasedStepCountRecord.fromSnapshot(s));

  static Future<UserBasedStepCountRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UserBasedStepCountRecord.fromSnapshot(s));

  static UserBasedStepCountRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserBasedStepCountRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserBasedStepCountRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserBasedStepCountRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserBasedStepCountRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserBasedStepCountRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserBasedStepCountRecordData({
  int? steps,
  DocumentReference? user,
  DateTime? joinedAt,
  DateTime? leftAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'steps': steps,
      'user': user,
      'joinedAt': joinedAt,
      'leftAt': leftAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserBasedStepCountRecordDocumentEquality
    implements Equality<UserBasedStepCountRecord> {
  const UserBasedStepCountRecordDocumentEquality();

  @override
  bool equals(UserBasedStepCountRecord? e1, UserBasedStepCountRecord? e2) {
    return e1?.steps == e2?.steps &&
        e1?.user == e2?.user &&
        e1?.joinedAt == e2?.joinedAt &&
        e1?.leftAt == e2?.leftAt;
  }

  @override
  int hash(UserBasedStepCountRecord? e) =>
      const ListEquality().hash([e?.steps, e?.user, e?.joinedAt, e?.leftAt]);

  @override
  bool isValidKey(Object? o) => o is UserBasedStepCountRecord;
}
