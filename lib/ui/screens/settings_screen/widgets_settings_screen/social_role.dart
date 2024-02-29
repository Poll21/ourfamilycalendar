import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_family_calendar/blocs/auth_bloc/auth_bloc.dart';
import 'package:our_family_calendar/blocs/setting_app_bloc/setting_app_bloc.dart';
import 'package:our_family_calendar/generated/l10n.dart';

class SocialRoleMobile extends StatelessWidget {
  final bool mobile;

  const SocialRoleMobile({super.key, required this.mobile});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingAppBloc, SettingAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: InkWell(
            onTap: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  backgroundColor: const Color(0x00ffffff),
                  insetPadding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  actionsPadding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  actions: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SocialRoleButton(
                          socialRole: S.of(context).working,
                          radius: 24,
                          radiusTop: true,
                        ),
                        SocialRoleButton(
                          socialRole: S.of(context).student,
                          radius: 0,
                          radiusTop: true,
                        ),
                        SocialRoleButton(
                          socialRole: S.of(context).schoolboy,
                          radius: 0,
                          radiusTop: true,
                        ),
                        SocialRoleButton(
                          socialRole: S.of(context).self_employed,
                          radius: 0,
                          radiusTop: true,
                        ),
                        SocialRoleButton(
                          socialRole: S.of(context).household,
                          radius: 0,
                          radiusTop: true,
                        ),
                        SocialRoleButton(
                          socialRole: S.of(context).not_determined,
                          radius: 24,
                          radiusTop: false,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            child: Container(
              height: (mobile) ? 75 : 50,
              padding: EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).shadowColor,
                        offset: const Offset(1, 1))
                  ],
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(12)),
              child: (mobile)
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '${S.of(context).social_role}:',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              (state.socialRole != '')
                                  ? state.socialRole
                                  : S.of(context).not_determined,
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
                          '${S.of(context).social_role}:',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          (state.socialRole != '')
                              ? state.socialRole
                              : S.of(context).not_determined,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}

class SocialRoleButton extends StatelessWidget {
  final String socialRole;
  final bool radiusTop;
  final double radius;

  const SocialRoleButton(
      {super.key,
      required this.socialRole,
      required this.radius,
      required this.radiusTop});

  @override
  Widget build(BuildContext context) {
    final _userId = context.read<AuthBloc>().state.user!.uid;
    return BlocBuilder<SettingAppBloc, SettingAppState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: InkWell(
            onTap: () {
              context.read<SettingAppBloc>().add(SettingAppSetEvent(
                  locale: null,
                  isAuthorized: null,
                  appTheme: null,
                  socialRole: socialRole, userId: _userId));
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              constraints: BoxConstraints(maxWidth: 300),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: (state.socialRole == socialRole)
                      ? Colors.white
                      : Colors.black54,
                  borderRadius: (radiusTop)
                      ? BorderRadius.vertical(top: Radius.circular(radius))
                      : BorderRadius.vertical(bottom: Radius.circular(radius))),
              child: Center(
                child: Text(socialRole,
                    style: (state.socialRole == socialRole)
                        ? TextStyle(color: Colors.black)
                        : TextStyle(color: Colors.white)),
              ),
            ),
          ),
        );
      },
    );
  }
}
