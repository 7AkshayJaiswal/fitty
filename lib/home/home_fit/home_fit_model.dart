import '/flutter_flow/flutter_flow_util.dart';
import '/global_component/background_card/background_card_widget.dart';
import 'home_fit_widget.dart' show HomeFitWidget;
import 'package:flutter/material.dart';

class HomeFitModel extends FlutterFlowModel<HomeFitWidget> {
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
