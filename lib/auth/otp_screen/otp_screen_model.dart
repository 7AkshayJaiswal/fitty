import '/flutter_flow/flutter_flow_util.dart';
import '/global_component/background_card/background_card_widget.dart';
import 'otp_screen_widget.dart' show OtpScreenWidget;
import 'package:flutter/material.dart';

class OtpScreenModel extends FlutterFlowModel<OtpScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BackgroundCard component.
  late BackgroundCardModel backgroundCardModel;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    backgroundCardModel = createModel(context, () => BackgroundCardModel());
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    backgroundCardModel.dispose();
    pinCodeController?.dispose();
  }
}
