import 'package:flutter/material.dart';
import 'package:our_family_calendar/generated/l10n.dart';
import 'package:our_family_calendar/main_navigation.dart';
import 'package:our_family_calendar/ui/screens/components_screens/my_drawer.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/metod_setting/application_version.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/widgets_settings_screen/buttn_text_widget.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/widgets_settings_screen/change_password.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/widgets_settings_screen/display_name.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/widgets_settings_screen/social_role.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/widgets_settings_screen/user_email.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/widgets_settings_screen/user_local.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/widgets_settings_screen/user_theme.dart';

class SettingsDesktopScaffolds extends StatelessWidget {
  const SettingsDesktopScaffolds({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).log_title),
      ),
      // drawer: const Padding(
      //     padding: EdgeInsets.only(top: 60), child: Drawer(child: MyDrawer())),
      body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(flex: 1, child: SingleChildScrollView(child: MyDrawer())),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(S.of(context).prof_sett,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 50,
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              padding: const EdgeInsets.all(12),
                              width: double.infinity,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    color: Theme.of(context).shadowColor, offset: const Offset(1, 1)),
                              ], color: Colors.black87, borderRadius: BorderRadius.circular(12)),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(Screens.getImage);
                                },
                                child: Text(S.of(context).prof_avatar),
                              ),
                            ),
                            const DisplayName(mobile: false,),
                            const UserEmail(mobile: false,),
                            const SocialRoleMobile(mobile: false),
                            const ChangePassword(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(S.of(context).app_sett,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            const UserTheme(mobile: false,),
                            const UserLocale(mobile: false,),
                            ButtonTextWidget(title: S.of(context).application_version,),
                            ButtonTextWidget(title: S.of(context).application_version,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
