import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_family_calendar/blocs/setting_app_bloc/setting_app_bloc.dart';

class UserTheme extends StatelessWidget {
  const UserTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingAppBloc, SettingAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text("Тема")),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        context.read<SettingAppBloc>().add(
                            SettingAppSetEvent(
                                isAuthorized: null,
                                locale: null,
                                appTheme: "kLightTheme"));
                      },
                      icon: Icon(
                        (state.appTheme == "kLightTheme")
                            ?Icons.expand_circle_down_sharp
                            :Icons.circle,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {
                        context.read<SettingAppBloc>().add(
                            SettingAppSetEvent(
                                isAuthorized: null,
                                locale: null,
                                appTheme: "kDarkTheme"));
                      },
                      icon: Icon(
                        (state.appTheme == "kDarkTheme")
                            ?Icons.expand_circle_down_sharp
                            :Icons.circle,
                        color: Colors.black,
                      )),
                  IconButton(
                      onPressed: () {
                        context.read<SettingAppBloc>().add(
                            SettingAppSetEvent(
                                isAuthorized: null,
                                locale: null,
                                appTheme: "kPinkTheme"));
                      },
                      icon: Icon(
                        (state.appTheme == "kPinkTheme")
                            ?Icons.expand_circle_down_sharp
                            :Icons.circle,
                        color: Colors.pinkAccent,
                      )),
                  IconButton(
                      onPressed: () {
                        context.read<SettingAppBloc>().add(
                            SettingAppSetEvent(
                                isAuthorized: null,
                                locale: null,
                                appTheme: "kBlueTheme"));
                      },
                      icon: Icon(
                        (state.appTheme == "kBlueTheme")
                            ?Icons.expand_circle_down_sharp
                            :Icons.circle,
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
