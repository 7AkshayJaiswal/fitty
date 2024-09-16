import '/flutter_flow/flutter_flow_util.dart';
import '/global_component/background_card/background_card_widget.dart';
import '/global_component/no_data_with_lottie/no_data_with_lottie_widget.dart';
import 'home_friends_widget.dart' show HomeFriendsWidget;
import 'package:flutter/material.dart';

class HomeFriendsModel extends FlutterFlowModel<HomeFriendsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BackgroundCard component.
  late BackgroundCardModel backgroundCardModel;
  // Model for NoDataWithLottie component.
  late NoDataWithLottieModel noDataWithLottieModel;

  @override
  void initState(BuildContext context) {
    backgroundCardModel = createModel(context, () => BackgroundCardModel());
    noDataWithLottieModel = createModel(context, () => NoDataWithLottieModel());
  }

  @override
  void dispose() {
    backgroundCardModel.dispose();
    noDataWithLottieModel.dispose();
  }
}
