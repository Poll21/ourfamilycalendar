import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_family_calendar/blocs/auth_bloc/auth_bloc.dart';
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

class SettingsMobileScaffolds extends StatelessWidget {
  const SettingsMobileScaffolds({super.key});

  @override
  Widget build(BuildContext context) {
    final _user = context.read<AuthBloc>().state.user;
    final _photoURL = _user?.photoURL ?? '';
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(S.of(context).log_title)),
      ),
      drawer: const Padding(
          padding: EdgeInsets.only(top: 60),
          child: Drawer(child: MyDrawer())),
      body: Container(
       padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: Text(
                      S.of(context).prof_sett,
                      style:
                      Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage((_photoURL !=
                            '')
                            ? _photoURL
                            : 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')),
                  ),
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
                    child: Text(S.of(context).prof_avatar, style: Theme.of(context).textTheme.bodyLarge,),
                  ),
                ),

                const DisplayName(
                  mobile: true,
                ),
                const UserEmail(
                  mobile: true,
                ),
                const SocialRoleMobile(
                  mobile: true,
                ),
                const ChangePassword(),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: Text(
                      S.of(context).app_sett,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium,
                    ),
                  ),
                ),
                const UserTheme(mobile: true,),
                const UserLocale(mobile: true,),
                ButtonTextWidget(title: S.of(context).application_version),
                ButtonTextWidget(title: S.of(context).application_version),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
