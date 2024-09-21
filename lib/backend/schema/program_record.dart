import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgramRecord extends FirestoreRecord {
  ProgramRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "groupsFollowing" field.
  DocumentReference? _groupsFollowing;
  DocumentReference? get groupsFollowing => _groupsFollowing;
  bool hasGroupsFollowing() => _groupsFollowing != null;

  // "usersFollowing" field.
  DocumentReference? _usersFollowing;
  DocumentReference? get usersFollowing => _usersFollowing;
  bool hasUsersFollowing() => _usersFollowing != null;

  // "programName" field.
  String? _programName;
  String get programName => _programName ?? '';
  bool hasProgramName() => _programName != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  void _initializeFields() {
    _groupsFollowing = snapshotData['groupsFollowing'] as DocumentReference?;
    _usersFollowing = snapshotData['usersFollowing'] as DocumentReference?;
    _programName = snapshotData['programName'] as String?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('program');

  static Stream<ProgramRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProgramRecord.fromSnapshot(s));

  static Future<ProgramRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProgramRecord.fromSnapshot(s));

  static ProgramRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProgramRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProgramRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProgramRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProgramRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProgramRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProgramRecordData({
  DocumentReference? groupsFollowing,
  DocumentReference? usersFollowing,
  String? programName,
  DocumentReference? createdBy,
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'groupsFollowing': groupsFollowing,
      'usersFollowing': usersFollowing,
      'programName': programName,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProgramRecordDocumentEquality implements Equality<ProgramRecord> {
  const ProgramRecordDocumentEquality();

  @override
  bool equals(ProgramRecord? e1, ProgramRecord? e2) {
    return e1?.groupsFollowing == e2?.groupsFollowing &&
        e1?.usersFollowing == e2?.usersFollowing &&
        e1?.programName == e2?.programName &&
        e1?.createdBy == e2?.createdBy &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt;
  }

  @override
  int hash(ProgramRecord? e) => const ListEquality().hash([
        e?.groupsFollowing,
        e?.usersFollowing,
        e?.programName,
        e?.createdBy,
        e?.createdAt,
        e?.updatedAt
      ]);

  @override
  bool isValidKey(Object? o) => o is ProgramRecord;
}
