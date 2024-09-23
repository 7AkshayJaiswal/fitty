import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_info_sheet_widget.dart' show UserInfoSheetWidget;
import 'package:flutter/material.dart';

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
