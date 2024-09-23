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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> checkFriendshipStatus(
  DocumentReference userAId,
  DocumentReference myUserId,
) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    // Use a single 'array-contains' filter for one user
    QuerySnapshot friendsSnapshot = await firestore
        .collection('friends')
        .where('users', arrayContains: userAId)
        .where('status', isEqualTo: 'friends')
        .get();

    // Check if the other user ID is present in the results
    bool isFriend = friendsSnapshot.docs.any((doc) {
      List<dynamic> users = doc['users'];
      return users.contains(myUserId);
    });

    if (isFriend) {
      return 'friends';
    }

    // Check friend request status with the same logic
    QuerySnapshot requestSnapshot = await firestore
        .collection('friendRequests')
        .where('users', arrayContains: userAId)
        .where('status', isEqualTo: 'requested')
        .get();

    bool isRequested = requestSnapshot.docs.any((doc) {
      List<dynamic> users = doc['users'];
      return users.contains(myUserId);
    });

    if (isRequested) {
      return 'requested';
    }

    return 'none'; // No friendship or request found
  } catch (e) {
    print('Error checking friendship status: $e');
    return 'error';
  }
}
