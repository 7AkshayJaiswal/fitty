import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyB6Um-zXOWnGaNquqxxfwMvWgwzLUKNwYE",
            authDomain: "fitty-41f26.firebaseapp.com",
            projectId: "fitty-41f26",
            storageBucket: "fitty-41f26.appspot.com",
            messagingSenderId: "700115072881",
            appId: "1:700115072881:web:d9c62eb14b351c9663e8d0",
            measurementId: "G-LBM87RVQD0"));
  } else {
    await Firebase.initializeApp();
  }
}
