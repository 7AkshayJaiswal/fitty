import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_walk_room_widget.dart' show CreateWalkRoomWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
