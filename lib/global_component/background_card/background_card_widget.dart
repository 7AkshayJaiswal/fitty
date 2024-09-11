import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'background_card_model.dart';
export 'background_card_model.dart';

class BackgroundCardWidget extends StatefulWidget {
  const BackgroundCardWidget({super.key});

  @override
  State<BackgroundCardWidget> createState() => _BackgroundCardWidgetState();
}

class _BackgroundCardWidgetState extends State<BackgroundCardWidget>
    with TickerProviderStateMixin {
  late BackgroundCardModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BackgroundCardModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: const Offset(3.0, 3.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 10.0,
        sigmaY: 10.0,
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              FlutterFlowTheme.of(context).secondaryBackground,
              FlutterFlowTheme.of(context).accent4,
              FlutterFlowTheme.of(context).secondary,
              FlutterFlowTheme.of(context).accent3
            ],
            stops: const [0.0, 0.4, 0.6, 1.0],
            begin: const AlignmentDirectional(-1.0, -1.0),
            end: const AlignmentDirectional(1.0, 1.0),
          ),
        ),
        child: Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0x1A000000),
                FlutterFlowTheme.of(context).secondaryBackground
              ],
              stops: const [0.0, 1.0],
              begin: const AlignmentDirectional(0.0, -1.0),
              end: const AlignmentDirectional(0, 1.0),
            ),
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
