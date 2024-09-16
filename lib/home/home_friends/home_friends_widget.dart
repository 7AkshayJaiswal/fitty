import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/global_component/background_card/background_card_widget.dart';
import '/global_component/no_data_with_lottie/no_data_with_lottie_widget.dart';
import '/global_component/user_info_grid/user_info_grid_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_friends_model.dart';
export 'home_friends_model.dart';

class HomeFriendsWidget extends StatefulWidget {
  const HomeFriendsWidget({super.key});

  @override
  State<HomeFriendsWidget> createState() => _HomeFriendsWidgetState();
}

class _HomeFriendsWidgetState extends State<HomeFriendsWidget> {
  late HomeFriendsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeFriendsModel());

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
                    'c1p1cejg' /* Fitty */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.of(context).accent3,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                      ),
                ),
                actions: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).primary,
                      icon: FaIcon(
                        FontAwesomeIcons.searchengin,
                        color: FlutterFlowTheme.of(context).info,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        context.pushNamed(
                          'UserSearch',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.rightToLeft,
                            ),
                          },
                        );
                      },
                    ),
                  ),
                ],
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
            StreamBuilder<List<FriendsRecord>>(
              stream: queryFriendsRecord(
                queryBuilder: (friendsRecord) => friendsRecord.where(
                  'users',
                  arrayContains: currentUserReference,
                ),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 36.0,
                      height: 36.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                List<FriendsRecord> containerFriendsRecordList = snapshot.data!;

                return Container(
                  decoration: const BoxDecoration(),
                  child: Builder(
                    builder: (context) {
                      if (containerFriendsRecordList.isNotEmpty) {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width * 0.025,
                                0.0,
                              ),
                              0.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width * 0.025,
                                0.0,
                              ),
                              0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 8.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '0n1zkcsy' /* Top Fitty Friends */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Flexible(
                                child: Builder(
                                  builder: (context) {
                                    final friendRef = containerFriendsRecordList
                                        .toList()
                                        .take(3)
                                        .toList();

                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 4.0,
                                        mainAxisSpacing: 0.0,
                                        childAspectRatio: 1.0,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: friendRef.length,
                                      itemBuilder: (context, friendRefIndex) {
                                        final friendRefItem =
                                            friendRef[friendRefIndex];
                                        return UserInfoGridWidget(
                                          key: Key(
                                              'Keygsb_${friendRefIndex}_of_${friendRef.length}'),
                                          user: functions.findOppositUser(
                                              friendRefItem,
                                              currentUserReference!),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              if (functions
                                      .removeFirst3Friends(
                                          containerFriendsRecordList.toList()).isNotEmpty)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 8.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '2fjjmgn7' /* All friends */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              Builder(
                                builder: (context) {
                                  final friend = functions
                                      .removeFirst3Friends(
                                          containerFriendsRecordList.toList())
                                      .toList()
                                      .take(10)
                                      .toList();

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: friend.length,
                                    itemBuilder: (context, friendIndex) {
                                      final friendItem = friend[friendIndex];
                                      return StreamBuilder<UsersRecord>(
                                        stream: UsersRecord.getDocument(
                                            functions.findOppositUser(
                                                friendItem,
                                                currentUserReference!)),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 36.0,
                                                height: 36.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }

                                          final listTileUsersRecord =
                                              snapshot.data!;

                                          return ListTile(
                                            title: Text(
                                              listTileUsersRecord.displayName,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            subtitle: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '3ce2a8tr' /* Last Message */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            dense: false,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: wrapWithModel(
                            model: _model.noDataWithLottieModel,
                            updateCallback: () => safeSetState(() {}),
                            child: const NoDataWithLottieWidget(
                              message:
                                  '\n\nNo friends,\n\nPlease add friend to grow together.',
                            ),
                          ),
                        );
                      }
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
