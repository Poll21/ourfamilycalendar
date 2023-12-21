import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_family_calendar/blocs/auth_bloc/auth_bloc.dart';
import 'package:our_family_calendar/generated/l10n.dart';

class UserEmail extends StatelessWidget {
  final bool mobile;

  const UserEmail({super.key, required this.mobile});

  @override
  Widget build(BuildContext context) {
    final _userEmail = context.read<AuthBloc>().state.user?.email ?? '';
    return Container(
      height: (mobile) ? 75 : 50,
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Theme.of(context).shadowColor, offset: const Offset(1,1)),],
          color: Colors.black87,
          borderRadius: BorderRadius.circular(12)),
      child: (mobile)
          ? Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "${S.of(context).log_Email}:",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    (_userEmail == '')
                        ? const SizedBox(
                            height: 18,
                            width: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ))
                        : Text(
                            _userEmail,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                  ],
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${S.of(context).log_Email}:",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                (_userEmail == '')
                    ? const SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ))
                    : Text(
                        _userEmail,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
              ],
            ),
    );
  }
}
