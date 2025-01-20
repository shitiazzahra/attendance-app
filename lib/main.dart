import 'package:attendance_app/ui/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      // data diambil dari file google-services.json
      apiKey: 'AIzaSyAa7lXPBA4Dm4p0BxhdfQ4lLv-InEkKrkk', // curent_key
      appId: '1:492970974258:android:4be2d8d254961b50b6f02b', // mobilesdk_app_id
      messagingSenderId: '492970974258', // project_number
      projectId: 'attendance-app-ac2ea' // project_id
    )
  );
  runApp(const AttendanceApp());
}

class AttendanceApp extends StatelessWidget {
  const AttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        cardTheme: const CardTheme(surfaceTintColor: Colors.white),
        dialogTheme: const DialogTheme(surfaceTintColor: Colors.white, backgroundColor: Colors.white),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true
      ),
      home: const HomeScreen(),
    );
  }
}