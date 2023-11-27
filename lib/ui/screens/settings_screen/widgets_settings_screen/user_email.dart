import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_family_calendar/blocs/auth_bloc/auth_bloc.dart';
import 'package:our_family_calendar/generated/l10n.dart';

class UserEmail extends StatelessWidget {
  const UserEmail({super.key});

  @override
  Widget build(BuildContext context) {
final _userEmail = context.read<AuthBloc>().state.user?.email ?? '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${S.of(context).log_Email}: "),
       const SizedBox(height: 8),
       Text(_userEmail),
      ],
    );
  }
}
