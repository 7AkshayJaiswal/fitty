import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WalkRoomsRecord extends FirestoreRecord {
  WalkRoomsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "roomName" field.
  String? _roomName;
  String get roomName => _roomName ?? '';
  bool hasRoomName() => _roomName != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "creationTimestamp" field.
  DateTime? _creationTimestamp;
  DateTime? get creationTimestamp => _creationTimestamp;
  bool hasCreationTimestamp() => _creationTimestamp != null;

  // "stepGoal" field.
  int? _stepGoal;
  int get stepGoal => _stepGoal ?? 0;
  bool hasStepGoal() => _stepGoal != null;

  // "startDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "endDate" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "privacy" field.
  bool? _privacy;
  bool get privacy => _privacy ?? false;
  bool hasPrivacy() => _privacy != null;

  // "expired" field.
  bool? _expired;
  bool get expired => _expired ?? false;
  bool hasExpired() => _expired != null;

  void _initializeFields() {
    _roomName = snapshotData['roomName'] as String?;
    _description = snapshotData['description'] as String?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _creationTimestamp = snapshotData['creationTimestamp'] as DateTime?;
    _stepGoal = castToType<int>(snapshotData['stepGoal']);
    _startDate = snapshotData['startDate'] as DateTime?;
    _endDate = snapshotData['endDate'] as DateTime?;
    _privacy = snapshotData['privacy'] as bool?;
    _expired = snapshotData['expired'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('walkRooms');

  static Stream<WalkRoomsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WalkRoomsRecord.fromSnapshot(s));

  static Future<WalkRoomsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WalkRoomsRecord.fromSnapshot(s));

  static WalkRoomsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WalkRoomsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WalkRoomsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WalkRoomsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WalkRoomsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WalkRoomsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWalkRoomsRecordData({
  String? roomName,
  String? description,
  DocumentReference? createdBy,
  DateTime? creationTimestamp,
  int? stepGoal,
  DateTime? startDate,
  DateTime? endDate,
  bool? privacy,
  bool? expired,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'roomName': roomName,
      'description': description,
      'createdBy': createdBy,
      'creationTimestamp': creationTimestamp,
      'stepGoal': stepGoal,
      'startDate': startDate,
      'endDate': endDate,
      'privacy': privacy,
      'expired': expired,
    }.withoutNulls,
  );

  return firestoreData;
}

class WalkRoomsRecordDocumentEquality implements Equality<WalkRoomsRecord> {
  const WalkRoomsRecordDocumentEquality();

  @override
  bool equals(WalkRoomsRecord? e1, WalkRoomsRecord? e2) {
    return e1?.roomName == e2?.roomName &&
        e1?.description == e2?.description &&
        e1?.createdBy == e2?.createdBy &&
        e1?.creationTimestamp == e2?.creationTimestamp &&
        e1?.stepGoal == e2?.stepGoal &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.privacy == e2?.privacy &&
        e1?.expired == e2?.expired;
  }

  @override
  int hash(WalkRoomsRecord? e) => const ListEquality().hash([
        e?.roomName,
        e?.description,
        e?.createdBy,
        e?.creationTimestamp,
        e?.stepGoal,
        e?.startDate,
        e?.endDate,
        e?.privacy,
        e?.expired
      ]);

  @override
  bool isValidKey(Object? o) => o is WalkRoomsRecord;
}
