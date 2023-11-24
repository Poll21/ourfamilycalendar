import 'package:flutter/material.dart';
import 'package:our_family_calendar/ui/screens/responsive/responsive_layout.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: ResponsiveLayout(
          mobileScaffold: InitialMobileScaffold(),
          tabletScaffold: InitialTabletScaffold(),
          desktopScaffold: InitialDesktopScaffold()),
    );
    ;
  }
}

class InitialMobileScaffold extends StatelessWidget {
  const InitialMobileScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class InitialTabletScaffold extends StatelessWidget {
  const InitialTabletScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class InitialDesktopScaffold extends StatelessWidget {
  const InitialDesktopScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
