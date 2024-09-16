import '/flutter_flow/flutter_flow_util.dart';
import '/global_component/background_card/background_card_widget.dart';
import 'on_boarding_screen_widget.dart' show OnBoardingScreenWidget;
import 'package:flutter/material.dart';

class OnBoardingScreenModel extends FlutterFlowModel<OnBoardingScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BackgroundCard component.
  late BackgroundCardModel backgroundCardModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {
    backgroundCardModel = createModel(context, () => BackgroundCardModel());
  }

  @override
  void dispose() {
    backgroundCardModel.dispose();
  }
}
