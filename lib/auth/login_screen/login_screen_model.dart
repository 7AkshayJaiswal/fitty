import '/flutter_flow/flutter_flow_util.dart';
import '/global_component/background_card/background_card_widget.dart';
import 'login_screen_widget.dart' show LoginScreenWidget;
import 'package:flutter/material.dart';

class LoginScreenModel extends FlutterFlowModel<LoginScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BackgroundCard component.
  late BackgroundCardModel backgroundCardModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    backgroundCardModel = createModel(context, () => BackgroundCardModel());
  }

  @override
  void dispose() {
    backgroundCardModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
