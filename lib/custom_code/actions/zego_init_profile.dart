// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:zego_express_engine/zego_express_engine.dart';
import 'package:flutter/foundation.dart';

Future zegoInitProfile() async {
  // Add your function code here!
  await ZegoExpressEngine.createEngineWithProfile(ZegoEngineProfile(
    346903783,
    ZegoScenario.Default,
    appSign: kIsWeb
        ? null
        : '32d332c4edbb12d3cf6519efb8d2df5a98117f6a28bf4b2687af370e3402ee85',
  ));
}
