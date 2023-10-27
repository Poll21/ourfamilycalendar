import 'package:flutter/material.dart';
import 'package:our_family_calendar/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final fifBas = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print(fifBas.options.projectId);
  runApp(const MyApp());
}



