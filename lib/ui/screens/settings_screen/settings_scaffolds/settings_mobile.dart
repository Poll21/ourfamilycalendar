import 'package:flutter/material.dart';
import 'package:our_family_calendar/generated/l10n.dart';
import 'package:our_family_calendar/main_navigation.dart';
import 'package:our_family_calendar/ui/screens/components_screens/my_drawer.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/widgets_settings_screen/application%20_version.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/widgets_settings_screen/display_name.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/widgets_settings_screen/social_role.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/widgets_settings_screen/user_avatar.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/widgets_settings_screen/user_email.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/widgets_settings_screen/user_local.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/widgets_settings_screen/user_theme.dart';

class SettingsMobileScaffolds extends StatelessWidget {
  const SettingsMobileScaffolds({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Padding(
          padding: EdgeInsets.only(top: 60),
          child: Drawer(child: MyDrawer())),
      body: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        child:Padding(
          padding:
          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UserAvatar(),
                    SizedBox(
                      height: 30,
                    ),
                    DisplayName(),
                    SizedBox(
                      height: 20,
                    ),
                    UserEmail(),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamed(Screens.changePassword);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(S.of(context).change_password),
                        ],
                      ),
                    ),
                    SocialRole(),

                  ]),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserTheme(),
                  UserLocale(),
                  ApplicationVersion(),
                ],)
            ],
          ),

        ),
      ),
    );
  }
}
