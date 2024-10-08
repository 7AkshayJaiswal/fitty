// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
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

Future<PedometerDataStruct> getStepCountData() async {
  // Add your function code here!
  StepCount stepCount = await Pedometer.stepCountStream.first;
  return PedometerDataStruct(steps: stepCount.steps, time: stepCount.timeStamp);
}
