import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/global_component/background_card/background_card_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'otp_screen_model.dart';
export 'otp_screen_model.dart';

class OtpScreenWidget extends StatefulWidget {
  const OtpScreenWidget({
    super.key,
    this.mobileNumber,
  });

  final String? mobileNumber;

  @override
  State<OtpScreenWidget> createState() => _OtpScreenWidgetState();
}

class _OtpScreenWidgetState extends State<OtpScreenWidget> {
  late OtpScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OtpScreenModel());

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
        body: Stack(
          children: [
            wrapWithModel(
              model: _model.backgroundCardModel,
              updateCallback: () => safeSetState(() {}),
              child: const BackgroundCardWidget(),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  valueOrDefault<double>(
                    MediaQuery.sizeOf(context).width * 0.10,
                    0.0,
                  ),
                  0.0,
                  valueOrDefault<double>(
                    MediaQuery.sizeOf(context).width * 0.10,
                    0.0,
                  ),
                  0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'lzp4nne1' /* Fitty */,
                    ),
                    style: FlutterFlowTheme.of(context).displayMedium.override(
                          fontFamily: 'Roboto',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 16.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                      },
                      child: RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'zdrqfmka' /* OTP sent to  */,
                              ),
                              style: const TextStyle(),
                            ),
                            TextSpan(
                              text: widget.mobileNumber!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '71e1lqwy' /*   */,
                              ),
                              style: const TextStyle(),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '0erf6er8' /* (Wrong Number) */,
                              ),
                              style: TextStyle(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 8.0,
                                decoration: TextDecoration.underline,
                              ),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  PinCodeTextField(
                    autoDisposeControllers: false,
                    appContext: context,
                    length: 6,
                    textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Roboto',
                          letterSpacing: 0.0,
                        ),
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    enableActiveFill: false,
                    autoFocus: true,
                    enablePinAutofill: false,
                    errorTextSpace: 16.0,
                    showCursor: true,
                    cursorColor: FlutterFlowTheme.of(context).primary,
                    obscureText: false,
                    hintCharacter: '●',
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      fieldHeight: 44.0,
                      fieldWidth: 44.0,
                      borderWidth: 2.0,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0),
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                      shape: PinCodeFieldShape.box,
                      activeColor: FlutterFlowTheme.of(context).primaryText,
                      inactiveColor: FlutterFlowTheme.of(context).alternate,
                      selectedColor: FlutterFlowTheme.of(context).secondary,
                    ),
                    controller: _model.pinCodeController,
                    onChanged: (_) {},
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator:
                        _model.pinCodeControllerValidator.asValidator(context),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        GoRouter.of(context).prepareAuthEvent();
                        final smsCodeVal = _model.pinCodeController!.text;
                        if (smsCodeVal.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Enter SMS verification code.'),
                            ),
                          );
                          return;
                        }
                        final phoneVerifiedUser =
                            await authManager.verifySmsCode(
                          context: context,
                          smsCode: smsCodeVal,
                        );
                        if (phoneVerifiedUser == null) {
                          return;
                        }

                        if (valueOrDefault<bool>(
                            currentUserDocument?.profileDone, false)) {
                          context.goNamedAuth(
                            'Home-Fit',
                            context.mounted,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.leftToRight,
                              ),
                            },
                          );
                        } else {
                          context.goNamedAuth(
                              'EditProfileScreen', context.mounted);
                        }
                      },
                      text: FFLocalizations.of(context).getText(
                        'nrsb9wzl' /* Verify & Continue */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 6.0, 24.0, 6.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.5,
                        borderSide: const BorderSide(
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 0.5,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              'jbwd1ca1' /* By creating account, you agree... */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                          ),
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              'o0cter3k' /* Fitty, */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Roboto',
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              '9rm9a228' /*  Terms and Conditions  */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                ),
                            mouseCursor: SystemMouseCursors.click,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                await launchURL(
                                    'https://www.termsfeed.com/legal/terms-of-use/');
                              },
                          ),
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              'fu9a2i0z' /*  and  */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              'j7xz4r2j' /* Privacy Policy */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  letterSpacing: 0.0,
                                ),
                            mouseCursor: SystemMouseCursors.click,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                await launchURL(
                                    'https://www.termsfeed.com/legal/privacy-policy/');
                              },
                          ),
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              'qhmoxo0q' /* . */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  letterSpacing: 0.0,
                                  decoration: TextDecoration.underline,
                                ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FlutterFlowIconButton(
                borderRadius: 30.0,
                borderWidth: 0.0,
                icon: Icon(
                  Icons.chevron_left_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
