import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_family_calendar/blocs/auth_bloc/auth_bloc.dart';

class HomaScreen extends StatelessWidget {
  const HomaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Column(
                children:[
                Text(state.user?.tenantId ?? ''),
                Text(state.user?.email ?? ''),
                Text(state.user?.phoneNumber ?? ''),
                Text(state.user?.displayName ?? ''),
                Text(state.user?.refreshToken ?? ''),
                Text(state.user?.photoURL ?? ''),
                ]

            ),
          ),
        );
      },
    );
  }
}
