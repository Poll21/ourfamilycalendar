import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_family_calendar/blocs/setting_app_bloc/setting_app_bloc.dart';
import 'package:our_family_calendar/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final fifBas = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final settingsBloc = SettingAppBloc()
    ..add(SettingAppGetEvent());
  print(fifBas.options.projectId);
  runApp(MultiBlocProvider(

    providers: [
      BlocProvider(
        create: (context) => settingsBloc,
      ),
    ],
    child: const MyApp(),
  ));
}



