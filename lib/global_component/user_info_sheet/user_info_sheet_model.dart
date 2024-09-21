import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'user_info_sheet_widget.dart' show UserInfoSheetWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserInfoSheetModel extends FlutterFlowModel<UserInfoSheetWidget> {
  ///  Local state fields for this component.

  bool isLoadingStatus = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - checkFriendshipStatus] action in UserInfoSheet widget.
  String? status;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FriendRequestsRecord? result;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
