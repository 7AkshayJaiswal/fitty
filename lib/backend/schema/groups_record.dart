import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroupsRecord extends FirestoreRecord {
  GroupsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "groupName" field.
  String? _groupName;
  String get groupName => _groupName ?? '';
  bool hasGroupName() => _groupName != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "groupImage" field.
  String? _groupImage;
  String get groupImage => _groupImage ?? '';
  bool hasGroupImage() => _groupImage != null;

  // "groupMembers" field.
  List<DocumentReference>? _groupMembers;
  List<DocumentReference> get groupMembers => _groupMembers ?? const [];
  bool hasGroupMembers() => _groupMembers != null;

  // "groupAdmins" field.
  List<DocumentReference>? _groupAdmins;
  List<DocumentReference> get groupAdmins => _groupAdmins ?? const [];
  bool hasGroupAdmins() => _groupAdmins != null;

  // "visibilityPrivate" field.
  bool? _visibilityPrivate;
  bool get visibilityPrivate => _visibilityPrivate ?? false;
  bool hasVisibilityPrivate() => _visibilityPrivate != null;

  void _initializeFields() {
    _groupName = snapshotData['groupName'] as String?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _description = snapshotData['description'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
    _groupImage = snapshotData['groupImage'] as String?;
    _groupMembers = getDataList(snapshotData['groupMembers']);
    _groupAdmins = getDataList(snapshotData['groupAdmins']);
    _visibilityPrivate = snapshotData['visibilityPrivate'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('groups');

  static Stream<GroupsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GroupsRecord.fromSnapshot(s));

  static Future<GroupsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GroupsRecord.fromSnapshot(s));

  static GroupsRecord fromSnapshot(DocumentSnapshot snapshot) => GroupsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GroupsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GroupsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GroupsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GroupsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGroupsRecordData({
  String? groupName,
  DocumentReference? createdBy,
  String? description,
  DateTime? createdAt,
  DateTime? updatedAt,
  String? groupImage,
  bool? visibilityPrivate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'groupName': groupName,
      'createdBy': createdBy,
      'description': description,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'groupImage': groupImage,
      'visibilityPrivate': visibilityPrivate,
    }.withoutNulls,
  );

  return firestoreData;
}

class GroupsRecordDocumentEquality implements Equality<GroupsRecord> {
  const GroupsRecordDocumentEquality();

  @override
  bool equals(GroupsRecord? e1, GroupsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.groupName == e2?.groupName &&
        e1?.createdBy == e2?.createdBy &&
        e1?.description == e2?.description &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.groupImage == e2?.groupImage &&
        listEquality.equals(e1?.groupMembers, e2?.groupMembers) &&
        listEquality.equals(e1?.groupAdmins, e2?.groupAdmins) &&
        e1?.visibilityPrivate == e2?.visibilityPrivate;
  }

  @override
  int hash(GroupsRecord? e) => const ListEquality().hash([
        e?.groupName,
        e?.createdBy,
        e?.description,
        e?.createdAt,
        e?.updatedAt,
        e?.groupImage,
        e?.groupMembers,
        e?.groupAdmins,
        e?.visibilityPrivate
      ]);

  @override
  bool isValidKey(Object? o) => o is GroupsRecord;
}
