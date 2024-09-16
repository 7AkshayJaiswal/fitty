import '/flutter_flow/flutter_flow_util.dart';
import '/global_component/background_card/background_card_widget.dart';
import 'welcome_screen_widget.dart' show WelcomeScreenWidget;
import 'package:flutter/material.dart';

class WelcomeScreenModel extends FlutterFlowModel<WelcomeScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BackgroundCard component.
  late BackgroundCardModel backgroundCardModel;

  @override
  void initState(BuildContext context) {
    backgroundCardModel = createModel(context, () => BackgroundCardModel());
  }

  @override
  void dispose() {
    backgroundCardModel.dispose();
  }
}
