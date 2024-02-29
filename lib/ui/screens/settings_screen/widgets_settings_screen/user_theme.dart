import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_family_calendar/blocs/auth_bloc/auth_bloc.dart';
import 'package:our_family_calendar/blocs/setting_app_bloc/setting_app_bloc.dart';
import 'package:our_family_calendar/generated/l10n.dart';

class UserTheme extends StatelessWidget {
  final bool mobile;

  const UserTheme({super.key, required this.mobile});

  @override
  Widget build(BuildContext context) {
    final _userId = context.read<AuthBloc>().state.user!.uid;
    return BlocConsumer<SettingAppBloc, SettingAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          height: (mobile) ? 75 : 50,
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: EdgeInsets.only(
              left: 12,
              right: 4,
              top: (mobile) ? 4 : 4,
              bottom: (mobile) ? 0 : 12),
          width: double.infinity,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Theme.of(context).shadowColor,
                offset: const Offset(1, 1)),
          ], color: Colors.black87, borderRadius: BorderRadius.circular(12)),
          child: (mobile)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(S.of(context).theme,
                        style: Theme.of(context).textTheme.bodyLarge),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              context.read<SettingAppBloc>().add(
                                  SettingAppSetEvent(
                                      appTheme: "kLightTheme", userId: _userId,
                                      ));
                            },
                            icon: Icon(
                              (state.appTheme == "kLightTheme")
                                  ? Icons.expand_circle_down_sharp
                                  : Icons.circle,
                              color: Colors.white,
                              size: 20,
                            )),
                        IconButton(
                            onPressed: () {
                              context.read<SettingAppBloc>().add(
                                  SettingAppSetEvent(
                                      appTheme: "kDarkTheme",
                                      userId: _userId));
                            },
                            icon: Icon(
                              (state.appTheme == "kDarkTheme")
                                  ? Icons.expand_circle_down_sharp
                                  : Icons.circle,
                              color: Colors.grey,
                              size: 20,
                            )),
                        IconButton(
                            onPressed: () {
                              context.read<SettingAppBloc>().add(
                                  SettingAppSetEvent(

                                      appTheme: "kPinkTheme", userId: _userId,
                                     ));
                            },
                            icon: Icon(
                              (state.appTheme == "kPinkTheme")
                                  ? Icons.expand_circle_down_sharp
                                  : Icons.circle,
                              color: Colors.pinkAccent,
                              size: 20,
                            )),
                        IconButton(
                            onPressed: () {
                              context.read<SettingAppBloc>().add(
                                  SettingAppSetEvent(
                                      appTheme: "kBlueTheme",
                                      userId: _userId));
                            },
                            icon: Icon(
                              (state.appTheme == "kBlueTheme")
                                  ? Icons.expand_circle_down_sharp
                                  : Icons.circle,
                              color: Colors.blueAccent,
                              size: 20,
                            )),
                      ],
                    )
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(S.of(context).theme,
                        style: Theme.of(context).textTheme.bodyLarge),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              context.read<SettingAppBloc>().add(
                                  SettingAppSetEvent(
                                      appTheme: "kLightTheme",
                                      userId: _userId));
                            },
                            icon: Icon(
                              (state.appTheme == "kLightTheme")
                                  ? Icons.expand_circle_down_sharp
                                  : Icons.circle,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {
                              context.read<SettingAppBloc>().add(
                                  SettingAppSetEvent(
                                      appTheme: "kDarkTheme",
                                      userId: _userId));
                            },
                            icon: Icon(
                              (state.appTheme == "kDarkTheme")
                                  ? Icons.expand_circle_down_sharp
                                  : Icons.circle,
                              color: Colors.grey,
                            )),
                        IconButton(
                            onPressed: () {
                              context.read<SettingAppBloc>().add(
                                  SettingAppSetEvent(

                                      appTheme: "kPinkTheme",
                                      userId: _userId));
                            },
                            icon: Icon(
                              (state.appTheme == "kPinkTheme")
                                  ? Icons.expand_circle_down_sharp
                                  : Icons.circle,
                              color: Colors.pinkAccent,
                            )),
                        IconButton(
                            onPressed: () {
                              context.read<SettingAppBloc>().add(
                                  SettingAppSetEvent(

                                      appTheme: "kBlueTheme",
                                      userId: _userId));
                            },
                            icon: Icon(
                              (state.appTheme == "kBlueTheme")
                                  ? Icons.expand_circle_down_sharp
                                  : Icons.circle,
                              color: Colors.blueAccent,
                            )),
                      ],
                    )
                  ],
                ),
        );
      },
    );
  }
}
