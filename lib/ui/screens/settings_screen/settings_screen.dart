import 'package:flutter/material.dart';
import 'package:our_family_calendar/ui/screens/responsive/responsive_layout.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/settings_scaffolds/settings_desktop.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/settings_scaffolds/settings_mobile.dart';
import 'package:our_family_calendar/ui/screens/settings_screen/settings_scaffolds/settings_tablet.dart';

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
