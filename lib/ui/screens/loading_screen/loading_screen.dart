import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_family_calendar/blocs/auth_bloc/auth_bloc.dart';
import 'package:our_family_calendar/blocs/setting_app_bloc/setting_app_bloc.dart';
import 'package:our_family_calendar/ui/screens/auth_screens/login_screen/login_screen.dart';
import 'package:our_family_calendar/ui/screens/home_screen/home_screen.dart';
import 'package:our_family_calendar/ui/screens/initial_screen/initial_screen.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocBuilder<SettingAppBloc, SettingAppState>(
          builder: (context, state) {
            if (state is SettingAppInit) {
              return const InitialScreen();
            } else {
              if (state.isAuthorized) {
                context.read<AuthBloc>().add(AuthSingInEvent());
                return BlocConsumer<AuthBloc, AuthState>(
                  builder: (BuildContext context, stateAuth) {
                    return (stateAuth.user != null)
                        ? const HomeScreen()
                        : const InitialScreen();
                  },
                  listener: (BuildContext context, stateAuth) {
                    if (stateAuth.error != '') {
                      print(stateAuth.error);
                    }
                  },);
              }else{
                return const LoginScreen();
              }
            }
          },
        ));
  }
}
