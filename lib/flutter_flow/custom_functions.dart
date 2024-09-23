import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

List<DocumentReference> mergeDocumentsUsers(
  DocumentReference aaa,
  DocumentReference bbb,
) {
  return [aaa, bbb];
}

List<FriendsRecord> removeFirst3Friends(List<FriendsRecord> list) {
  // Check if the list is null or has less than or equal to 3 users
  if (list.length <= 3) {
    // Return an empty list if the condition is met
    return [];
  }

  // Return a sublist starting from the fourth element
  return list.sublist(3);
}

DocumentReference findOppositUser(
  FriendsRecord friend,
  DocumentReference currentUser,
) {
  // take document reference from friends document and compare with current, and return opposite one
  if (friend.user1ID == currentUser) {
    return friend.user2ID!;
  } else {
    return friend.user1ID!;
  }
}

DateTime addTime(
  DateTime startTime,
  String timeToAdd,
) {
  switch (timeToAdd) {
    case '15 Min':
      return startTime.add(Duration(minutes: 15));
    case '30 Min':
      return startTime.add(Duration(minutes: 30));
    case '45 Min':
      return startTime.add(Duration(minutes: 45));
    case '1 Hour':
      return startTime.add(Duration(minutes: 60));
    default:
      return startTime; // No time added if none of the cases match
  }
}
