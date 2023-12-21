import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_family_calendar/blocs/auth_bloc/auth_bloc.dart';
import 'package:our_family_calendar/generated/l10n.dart';
import 'package:our_family_calendar/main_navigation.dart';
import 'package:our_family_calendar/ui/screens/components_screens/my_drawer.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/widgets_settings_screen/application%20_version.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/widgets_settings_screen/change_password.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/widgets_settings_screen/display_name.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/widgets_settings_screen/social_role.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/widgets_settings_screen/user_avatar.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/widgets_settings_screen/user_email.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/widgets_settings_screen/user_local.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/widgets_settings_screen/user_theme.dart';

class SettingsTabletScaffolds extends StatelessWidget {
  const SettingsTabletScaffolds({super.key});

  @override
  Widget build(BuildContext context) {
    final _user = context.read<AuthBloc>().state.user;
    final _photoURL = _user?.photoURL ?? '';
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).log_title),
      ),
      drawer: const Padding(
          padding: EdgeInsets.only(top: 60), child: Drawer(child: MyDrawer())),
      body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
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
                            Center(
                              child: Text(
                                S.of(context).prof_sett,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ),
                            Wrap(
                              spacing: 16,
                              runSpacing: 8,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage((_photoURL !=
                                            '')
                                        ? _photoURL
                                        : 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(Screens.getImage);
                                  },
                                  child: Text(S.of(context).prof_avatar),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            DisplayName(
                              mobile: true,
                            ),
                            UserEmail(
                              mobile: true,
                            ),
                            SocialRoleMobile(
                              mobile: true,
                            ),
                            ChangePassword(),
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
                                Center(
                                  child: Text(
                                    S.of(context).app_sett,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  ),
                                ),
                              ],
                            ),
                            UserTheme(mobile: true,),
                            UserLocale(mobile: true,),
                            ApplicationVersion(),
                            ApplicationVersion(),
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
