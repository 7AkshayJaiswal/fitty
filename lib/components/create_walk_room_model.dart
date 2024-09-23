import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_walk_room_widget.dart' show CreateWalkRoomWidget;
import 'package:flutter/material.dart';

class CreateWalkRoomModel extends FlutterFlowModel<CreateWalkRoomWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for ChoiceChipsStartTime widget.
  FormFieldController<List<String>>? choiceChipsStartTimeValueController;
  String? get choiceChipsStartTimeValue =>
      choiceChipsStartTimeValueController?.value?.firstOrNull;
  set choiceChipsStartTimeValue(String? val) =>
      choiceChipsStartTimeValueController?.value = val != null ? [val] : [];
  DateTime? datePicked;
  // State field(s) for ChoiceChipsWalkType widget.
  FormFieldController<List<String>>? choiceChipsWalkTypeValueController;
  String? get choiceChipsWalkTypeValue =>
      choiceChipsWalkTypeValueController?.value?.firstOrNull;
  set choiceChipsWalkTypeValue(String? val) =>
      choiceChipsWalkTypeValueController?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChipsTimeLimit widget.
  FormFieldController<List<String>>? choiceChipsTimeLimitValueController;
  String? get choiceChipsTimeLimitValue =>
      choiceChipsTimeLimitValueController?.value?.firstOrNull;
  set choiceChipsTimeLimitValue(String? val) =>
      choiceChipsTimeLimitValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  WalkRoomsRecord? walkroom;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
