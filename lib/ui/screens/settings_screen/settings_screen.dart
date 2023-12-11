import 'package:flutter/material.dart';
import 'package:our_family_calendar/generated/l10n.dart';
import 'package:our_family_calendar/main_navigation.dart';
import 'package:our_family_calendar/ui/screens/components_screens/my_drawer.dart';
import 'package:our_family_calendar/ui/screens/responsive/responsive_layout.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/settings_scaffolds/settings_desktop.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/settings_scaffolds/settings_mobile.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/settings_scaffolds/settings_tablet.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/widgets_settings_screen/application%20_version.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/widgets_settings_screen/user_avatar.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/widgets_settings_screen/user_email.dart';
import 'widgets_settings_screen/display_name.dart';
import 'widgets_settings_screen/social_role.dart';
import 'widgets_settings_screen/user_local.dart';
import 'widgets_settings_screen/user_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child:  ResponsiveLayout(
            mobileScaffold: SettingsMobileScaffolds(),
            tabletScaffold: SettingsTabletScaffolds(),
            desktopScaffold: SettingsDesktopScaffolds()),
    );
  }
}
