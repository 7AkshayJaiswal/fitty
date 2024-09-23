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

import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> requestPermissionAudio() async {
  // Add your function code here!
  debugPrint("requestPermission...");
  try {
    PermissionStatus microphoneStatus = await Permission.microphone.request();
    if (microphoneStatus != PermissionStatus.granted) {
      debugPrint('Error: Microphone permission not granted!!!');
      return false;
    }
  } on Exception catch (error) {
    debugPrint("[ERROR], request microphone permission exception, $error");
  }

  try {
    PermissionStatus cameraStatus = await Permission.camera.request();
    if (cameraStatus != PermissionStatus.granted) {
      debugPrint('Error: Camera permission not granted!!!');
      return false;
    }
  } on Exception catch (error) {
    debugPrint("[ERROR], request camera permission exception, $error");
  }

  return true;
}
