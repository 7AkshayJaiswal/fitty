import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/global_component/background_card/background_card_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'home_my_day_widget.dart' show HomeMyDayWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeMyDayModel extends FlutterFlowModel<HomeMyDayWidget> {
  ///  Local state fields for this page.

  bool showCount = false;

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
