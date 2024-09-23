// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:animated_weight_picker/animated_weight_picker.dart';

class AnimatedWeightPicker extends StatefulWidget {
  const AnimatedWeightPicker({
    super.key,
    this.width,
    this.height,
    required this.intialWeight,
    required this.onSelect,
  });

  final double? width;
  final double? height;
  final String intialWeight;
  final Future Function(double weight) onSelect;

  @override
  State<AnimatedWeightPicker> createState() => _AnimatedWeightPickerState();
}

class _AnimatedWeightPickerState extends State<AnimatedWeightPicker> {
  final double min = 0;
  final double max = 10;

  @override
  Widget build(BuildContext context) {
    return AnimatedWeightPicker(
      intialWeight: widget.intialWeight,
      onSelect: (s) async {
        print(s);
        return s;
      },
    );
  }
}
