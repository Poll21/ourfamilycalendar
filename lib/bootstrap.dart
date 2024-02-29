import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_family_calendar/blocs/auth_bloc/auth_bloc.dart';
import 'package:our_family_calendar/blocs/internet_connect/internet_connect_cubit.dart';
import 'package:our_family_calendar/blocs/loading_bloc/loading_bloc.dart';
import 'package:our_family_calendar/blocs/setting_app_bloc/setting_app_bloc.dart';
import 'package:our_family_calendar/firebase_options.dart';

import 'my_app.dart';
import 'services/firebase/firebase_push.dart';

void bootstrap() async{
  final Connectivity connectivity = Connectivity();

  WidgetsFlutterBinding.ensureInitialized();

  final fifBas = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebasePush().initNotifications();
  final settingsBloc = SettingAppBloc()..add(SettingAppGetEvent());
  print(fifBas.options.projectId);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => InternetConnectCubit(connectivity: connectivity)),
      BlocProvider(
        create: (context) => settingsBloc,
      ),
      BlocProvider(
        create: (context) => LoadingBloc(),
      ),
      BlocProvider(
        create: (context) => AuthBloc(),
      ),
    ],
    child: const MyApp(),
  ));
}