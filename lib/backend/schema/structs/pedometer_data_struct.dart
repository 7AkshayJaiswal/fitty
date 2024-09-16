// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PedometerDataStruct extends FFFirebaseStruct {
  PedometerDataStruct({
    DateTime? time,
    int? steps,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _time = time,
        _steps = steps,
        super(firestoreUtilData);

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  set time(DateTime? val) => _time = val;

  bool hasTime() => _time != null;

  // "steps" field.
  int? _steps;
  int get steps => _steps ?? 0;
  set steps(int? val) => _steps = val;

  void incrementSteps(int amount) => steps = steps + amount;

  bool hasSteps() => _steps != null;

  static PedometerDataStruct fromMap(Map<String, dynamic> data) =>
      PedometerDataStruct(
        time: data['time'] as DateTime?,
        steps: castToType<int>(data['steps']),
      );

  static PedometerDataStruct? maybeFromMap(dynamic data) => data is Map
      ? PedometerDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'time': _time,
        'steps': _steps,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'time': serializeParam(
          _time,
          ParamType.DateTime,
        ),
        'steps': serializeParam(
          _steps,
          ParamType.int,
        ),
      }.withoutNulls;

  static PedometerDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      PedometerDataStruct(
        time: deserializeParam(
          data['time'],
          ParamType.DateTime,
          false,
        ),
        steps: deserializeParam(
          data['steps'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PedometerDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PedometerDataStruct &&
        time == other.time &&
        steps == other.steps;
  }

  @override
  int get hashCode => const ListEquality().hash([time, steps]);
}

PedometerDataStruct createPedometerDataStruct({
  DateTime? time,
  int? steps,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PedometerDataStruct(
      time: time,
      steps: steps,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PedometerDataStruct? updatePedometerDataStruct(
  PedometerDataStruct? pedometerData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pedometerData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPedometerDataStructData(
  Map<String, dynamic> firestoreData,
  PedometerDataStruct? pedometerData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pedometerData == null) {
    return;
  }
  if (pedometerData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && pedometerData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pedometerDataData =
      getPedometerDataFirestoreData(pedometerData, forFieldValue);
  final nestedData =
      pedometerDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = pedometerData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPedometerDataFirestoreData(
  PedometerDataStruct? pedometerData, [
  bool forFieldValue = false,
]) {
  if (pedometerData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pedometerData.toMap());

  // Add any Firestore field values
  pedometerData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPedometerDataListFirestoreData(
  List<PedometerDataStruct>? pedometerDatas,
) =>
    pedometerDatas
        ?.map((e) => getPedometerDataFirestoreData(e, true))
        .toList() ??
    [];
