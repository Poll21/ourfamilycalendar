import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_family_calendar/blocs/setting_app_bloc/setting_app_bloc.dart';
import 'package:our_family_calendar/generated/l10n.dart';

class SocialRole extends StatelessWidget {
  const SocialRole({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingAppBloc, SettingAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(S.of(context).social_role),
            InkWell(
                onTap: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      backgroundColor: const Color(0x00ffffff),
                      insetPadding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0),
                      actionsPadding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0),
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
                child: Text((state.socialRole != '')
                    ? state.socialRole
                    : S.of(context).not_determined)),
          ],
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
                  socialRole: socialRole));
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              constraints: BoxConstraints(maxWidth: 300),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: (state.socialRole == socialRole)
                      ? Colors.white
                      : Colors.black38,
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
