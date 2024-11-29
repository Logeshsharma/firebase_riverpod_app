import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firebase_app/feature/auth/auth_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBL0B_KRSAwg0B2BoJ-7ag6yNwS-oCJSEI",
        authDomain: "fir-riverpod-app-37497.firebaseapp.com",
        projectId: "firebase-riverpod-app",
        storageBucket: "firebase-riverpod-app.firebasestorage.app",
        messagingSenderId: "462408769873",
        appId: "1:462408769873:web:c58dbeee12716b3669f370"),
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
    );
  }
}
