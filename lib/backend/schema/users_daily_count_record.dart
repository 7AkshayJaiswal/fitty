import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersDailyCountRecord extends FirestoreRecord {
  UsersDailyCountRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "updateAt" field.
  DateTime? _updateAt;
  DateTime? get updateAt => _updateAt;
  bool hasUpdateAt() => _updateAt != null;

  // "stepsCount" field.
  int? _stepsCount;
  int get stepsCount => _stepsCount ?? 0;
  bool hasStepsCount() => _stepsCount != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
    _updateAt = snapshotData['updateAt'] as DateTime?;
    _stepsCount = castToType<int>(snapshotData['stepsCount']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('usersDailyCount');

  static Stream<UsersDailyCountRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersDailyCountRecord.fromSnapshot(s));

  static Future<UsersDailyCountRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersDailyCountRecord.fromSnapshot(s));

  static UsersDailyCountRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsersDailyCountRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersDailyCountRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersDailyCountRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersDailyCountRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersDailyCountRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersDailyCountRecordData({
  DocumentReference? userId,
  DateTime? date,
  DateTime? updateAt,
  int? stepsCount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'date': date,
      'updateAt': updateAt,
      'stepsCount': stepsCount,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersDailyCountRecordDocumentEquality
    implements Equality<UsersDailyCountRecord> {
  const UsersDailyCountRecordDocumentEquality();

  @override
  bool equals(UsersDailyCountRecord? e1, UsersDailyCountRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.date == e2?.date &&
        e1?.updateAt == e2?.updateAt &&
        e1?.stepsCount == e2?.stepsCount;
  }

  @override
  int hash(UsersDailyCountRecord? e) => const ListEquality()
      .hash([e?.userId, e?.date, e?.updateAt, e?.stepsCount]);

  @override
  bool isValidKey(Object? o) => o is UsersDailyCountRecord;
}
