import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/global_component/background_card/background_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'create_walk_room_screen_model.dart';
export 'create_walk_room_screen_model.dart';

class CreateWalkRoomScreenWidget extends StatefulWidget {
  const CreateWalkRoomScreenWidget({
    super.key,
    required this.walkRoom,
  });

  final WalkRoomsRecord? walkRoom;

  @override
  State<CreateWalkRoomScreenWidget> createState() =>
      _CreateWalkRoomScreenWidgetState();
}

class _CreateWalkRoomScreenWidgetState
    extends State<CreateWalkRoomScreenWidget> {
  late CreateWalkRoomScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateWalkRoomScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (valueOrDefault<bool>(currentUserDocument?.profileDone, false)) {
        return;
      }

      context.goNamed('EditProfileScreen');
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        )
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: true,
                title: Text(
                  FFLocalizations.of(context).getText(
                    'qc4kpics' /* WalkRoom */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Urbanist',
                        color: FlutterFlowTheme.of(context).accent3,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                      ),
                ),
                actions: const [],
                centerTitle: false,
                elevation: 0.0,
              )
            : null,
        body: Stack(
          children: [
            wrapWithModel(
              model: _model.backgroundCardModel,
              updateCallback: () => safeSetState(() {}),
              child: const BackgroundCardWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
