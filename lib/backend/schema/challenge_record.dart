import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChallengeRecord extends FirestoreRecord {
  ChallengeRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "isFullDay" field.
  bool? _isFullDay;
  bool get isFullDay => _isFullDay ?? false;
  bool hasIsFullDay() => _isFullDay != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "shareLink" field.
  String? _shareLink;
  String get shareLink => _shareLink ?? '';
  bool hasShareLink() => _shareLink != null;

  // "usersJoined" field.
  List<DocumentReference>? _usersJoined;
  List<DocumentReference> get usersJoined => _usersJoined ?? const [];
  bool hasUsersJoined() => _usersJoined != null;

  void _initializeFields() {
    _isFullDay = snapshotData['isFullDay'] as bool?;
    _title = snapshotData['title'] as String?;
    _image = snapshotData['image'] as String?;
    _description = snapshotData['description'] as String?;
    _shareLink = snapshotData['shareLink'] as String?;
    _usersJoined = getDataList(snapshotData['usersJoined']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('challenge');

  static Stream<ChallengeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChallengeRecord.fromSnapshot(s));

  static Future<ChallengeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChallengeRecord.fromSnapshot(s));

  static ChallengeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChallengeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChallengeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChallengeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChallengeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChallengeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChallengeRecordData({
  bool? isFullDay,
  String? title,
  String? image,
  String? description,
  String? shareLink,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'isFullDay': isFullDay,
      'title': title,
      'image': image,
      'description': description,
      'shareLink': shareLink,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChallengeRecordDocumentEquality implements Equality<ChallengeRecord> {
  const ChallengeRecordDocumentEquality();

  @override
  bool equals(ChallengeRecord? e1, ChallengeRecord? e2) {
    const listEquality = ListEquality();
    return e1?.isFullDay == e2?.isFullDay &&
        e1?.title == e2?.title &&
        e1?.image == e2?.image &&
        e1?.description == e2?.description &&
        e1?.shareLink == e2?.shareLink &&
        listEquality.equals(e1?.usersJoined, e2?.usersJoined);
  }

  @override
  int hash(ChallengeRecord? e) => const ListEquality().hash([
        e?.isFullDay,
        e?.title,
        e?.image,
        e?.description,
        e?.shareLink,
        e?.usersJoined
      ]);

  @override
  bool isValidKey(Object? o) => o is ChallengeRecord;
}
