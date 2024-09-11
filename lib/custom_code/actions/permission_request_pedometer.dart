// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> permissionRequestPedometer() async {
  // Add your function code here!
  bool granted = await Permission.activityRecognition.isGranted;

  if (!granted) {
    granted = await Permission.activityRecognition.request() ==
        PermissionStatus.granted;
  }

  return granted;
}
