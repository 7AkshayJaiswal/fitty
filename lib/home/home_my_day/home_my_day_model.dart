import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/global_component/background_card/background_card_widget.dart';
import 'home_my_day_widget.dart' show HomeMyDayWidget;
import 'package:flutter/material.dart';

class HomeMyDayModel extends FlutterFlowModel<HomeMyDayWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - permissionRequestPedometer] action in Home-MyDay widget.
  bool? permissionResult;
  // Stores action output result for [Custom Action - getStepCountData] action in Home-MyDay widget.
  PedometerDataStruct? stepCount;
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
