import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/global_component/background_card/background_card_widget.dart';
import '/global_component/no_data_with_lottie/no_data_with_lottie_widget.dart';
import '/global_component/user_info_grid/user_info_grid_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_friends_widget.dart' show HomeFriendsWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
