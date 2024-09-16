import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'view_requests_model.dart';
export 'view_requests_model.dart';

class ViewRequestsWidget extends StatefulWidget {
  const ViewRequestsWidget({super.key});

  @override
  State<ViewRequestsWidget> createState() => _ViewRequestsWidgetState();
}

class _ViewRequestsWidgetState extends State<ViewRequestsWidget>
    with TickerProviderStateMixin {
  late ViewRequestsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewRequestsModel());

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
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                ),
                title: Text(
                  FFLocalizations.of(context).getText(
                    'r433s7mj' /* Friend Requests */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Roboto',
                        letterSpacing: 0.0,
                      ),
                ),
                actions: const [],
                centerTitle: false,
                elevation: 0.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'b901u6x2' /* Recent search... */,
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Roboto',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                  child: StreamBuilder<List<FriendRequestsRecord>>(
                    stream: queryFriendRequestsRecord(
                      queryBuilder: (friendRequestsRecord) =>
                          friendRequestsRecord
                              .where(
                                'toUserID',
                                isEqualTo: currentUserReference,
                              )
                              .where(
                                'status',
                                isEqualTo: 'requested',
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
                      List<FriendRequestsRecord>
                          listViewFriendRequestsRecordList = snapshot.data!;

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewFriendRequestsRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewFriendRequestsRecord =
                              listViewFriendRequestsRecordList[listViewIndex];
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 1.0),
                                child: StreamBuilder<UsersRecord>(
                                  stream: UsersRecord.getDocument(
                                      listViewFriendRequestsRecord.fromUserID!),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 36.0,
                                          height: 36.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }

                                    final containerUsersRecord = snapshot.data!;

                                    return Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 0.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            offset: const Offset(
                                              0.0,
                                              1.0,
                                            ),
                                          )
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                              child: Image.network(
                                                containerUsersRecord.photoUrl,
                                                width: 60.0,
                                                height: 60.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  6.0),
                                                      child: Text(
                                                        containerUsersRecord
                                                            .displayName,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Text(
                                                      dateTimeFormat(
                                                        "relative",
                                                        listViewFriendRequestsRecord
                                                            .requestSentAt!,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            if (listViewFriendRequestsRecord
                                                    .status ==
                                                'requested')
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                6.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      borderRadius: 8.0,
                                                      buttonSize: 40.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      icon: Icon(
                                                        Icons.close,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () async {
                                                        await listViewFriendRequestsRecord
                                                            .reference
                                                            .update({
                                                          ...createFriendRequestsRecordData(
                                                            status: 'rejected',
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'updatedAt':
                                                                  FieldValue
                                                                      .serverTimestamp(),
                                                            },
                                                          ),
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent3,
                                                    borderRadius: 8.0,
                                                    buttonSize: 40.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    icon: Icon(
                                                      Icons.check_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent3,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      await listViewFriendRequestsRecord
                                                          .reference
                                                          .update({
                                                        ...createFriendRequestsRecordData(
                                                          status: 'accepted',
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'updatedAt': FieldValue
                                                                .serverTimestamp(),
                                                          },
                                                        ),
                                                      });

                                                      await FriendsRecord
                                                          .collection
                                                          .doc()
                                                          .set({
                                                        ...createFriendsRecordData(
                                                          user1ID:
                                                              listViewFriendRequestsRecord
                                                                  .toUserID,
                                                          user2ID:
                                                              listViewFriendRequestsRecord
                                                                  .fromUserID,
                                                          status:
                                                              FriendShipStatus
                                                                  .friends,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'createdAt': FieldValue
                                                                .serverTimestamp(),
                                                            'updatedAt': FieldValue
                                                                .serverTimestamp(),
                                                            'users': functions.mergeDocumentsUsers(
                                                                listViewFriendRequestsRecord
                                                                    .fromUserID!,
                                                                listViewFriendRequestsRecord
                                                                    .toUserID!),
                                                          },
                                                        ),
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
