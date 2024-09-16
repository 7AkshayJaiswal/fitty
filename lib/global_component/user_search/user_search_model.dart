import '/flutter_flow/flutter_flow_util.dart';
import 'user_search_widget.dart' show UserSearchWidget;
import 'package:flutter/material.dart';

class UserSearchModel extends FlutterFlowModel<UserSearchWidget> {
  ///  Local state fields for this page.

  String searchTerm = ' ';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
