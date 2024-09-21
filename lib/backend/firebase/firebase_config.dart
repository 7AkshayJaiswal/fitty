import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAcjGeD6YLSvG6L5DgLUj8bc-HaCclvjas",
            authDomain: "gumm-be034.firebaseapp.com",
            projectId: "gumm-be034",
            storageBucket: "gumm-be034.appspot.com",
            messagingSenderId: "841935504894",
            appId: "1:841935504894:web:dfa9b6a6177b198dc76caf",
            measurementId: "G-EY3WK2JKFB"));
  } else {
    await Firebase.initializeApp();
  }
}
