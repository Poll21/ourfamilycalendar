import 'package:flutter/material.dart';
import 'package:our_family_calendar/ui/screens/home_screen/home_scffolds/home_desktop.dart';
import 'package:our_family_calendar/ui/screens/home_screen/home_scffolds/home_mobile.dart';
import 'package:our_family_calendar/ui/screens/home_screen/home_scffolds/home_tablet.dart';
import 'package:our_family_calendar/ui/screens/responsive/responsive_layout.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: ResponsiveLayout(
          mobileScaffold: HomeMobileScaffold(),
          tabletScaffold: HomeTabletScaffold(),
          desktopScaffold: HomeDesktopScaffold()),
    );
  }
}
