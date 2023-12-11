import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_family_calendar/blocs/auth_bloc/auth_bloc.dart';
import 'package:our_family_calendar/generated/l10n.dart';
import 'package:our_family_calendar/main_navigation.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final _photoURL =state.user?.photoURL ?? '';
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      (_photoURL !='') ? _photoURL
                          :'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                ),

              ],
            ),
          ],
        );
      },
    );
  }
}
