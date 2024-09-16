import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'no_data_with_lottie_model.dart';
export 'no_data_with_lottie_model.dart';

class NoDataWithLottieWidget extends StatefulWidget {
  const NoDataWithLottieWidget({
    super.key,
    String? message,
  }) : message = message ?? 'No data found';

  final String message;

  @override
  State<NoDataWithLottieWidget> createState() => _NoDataWithLottieWidgetState();
}

class _NoDataWithLottieWidgetState extends State<NoDataWithLottieWidget> {
  late NoDataWithLottieModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoDataWithLottieModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset(
          'assets/lottie_animations/FriendGym.json',
          width: 200.0,
          height: 200.0,
          fit: BoxFit.contain,
          animate: true,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 12.0),
          child: Text(
            widget.message,
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  fontFamily: 'Roboto',
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ],
    );
  }
}
