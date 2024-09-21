import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoHostRecord extends FirestoreRecord {
  CoHostRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "coHostUser" field.
  DocumentReference? _coHostUser;
  DocumentReference? get coHostUser => _coHostUser;
  bool hasCoHostUser() => _coHostUser != null;

  // "isDafault" field.
  bool? _isDafault;
  bool get isDafault => _isDafault ?? false;
  bool hasIsDafault() => _isDafault != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _coHostUser = snapshotData['coHostUser'] as DocumentReference?;
    _isDafault = snapshotData['isDafault'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('coHost')
          : FirebaseFirestore.instance.collectionGroup('coHost');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('coHost').doc(id);

  static Stream<CoHostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CoHostRecord.fromSnapshot(s));

  static Future<CoHostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CoHostRecord.fromSnapshot(s));

  static CoHostRecord fromSnapshot(DocumentSnapshot snapshot) => CoHostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CoHostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CoHostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CoHostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CoHostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCoHostRecordData({
  DocumentReference? coHostUser,
  bool? isDafault,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'coHostUser': coHostUser,
      'isDafault': isDafault,
    }.withoutNulls,
  );

  return firestoreData;
}

class CoHostRecordDocumentEquality implements Equality<CoHostRecord> {
  const CoHostRecordDocumentEquality();

  @override
  bool equals(CoHostRecord? e1, CoHostRecord? e2) {
    return e1?.coHostUser == e2?.coHostUser && e1?.isDafault == e2?.isDafault;
  }

  @override
  int hash(CoHostRecord? e) =>
      const ListEquality().hash([e?.coHostUser, e?.isDafault]);

  @override
  bool isValidKey(Object? o) => o is CoHostRecord;
}
